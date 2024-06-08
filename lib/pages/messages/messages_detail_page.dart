import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:medapp/model/doctor.dart';
import 'package:medapp/model/message.dart';
import 'package:medapp/model/user.dart';
import 'package:medapp/services/message_service.dart';
import 'package:medapp/utils/random_id.dart';

import '../../routes/routes.dart';
import '../../utils/constants.dart';

class MessagesDetailPage extends StatefulWidget {
  final Doctor doctor;
  final UserModel userModel;
  MessagesDetailPage({required this.doctor, required this.userModel});
  @override
  _MessagesDetailPageState createState() => _MessagesDetailPageState();
}

class _MessagesDetailPageState extends State<MessagesDetailPage> {
  final TextEditingController _messageController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final DatabaseReference _messagesRef = FirebaseDatabase.instance
        .ref()
        .child('messages/${widget.userModel.id}/${widget.doctor.id}');

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: <Widget>[
            Container(
              width: 40,
              height: 40,
              child: Stack(
                children: <Widget>[
                  CircleAvatar(
                    radius: 18,
                    backgroundColor: Colors.transparent,
                    child: Image.asset(
                      widget.doctor.avatar ?? 'assets/images/icon_doctor_1.png',
                      fit: BoxFit.fill,
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Container(
                      margin: EdgeInsets.all(2),
                      padding: EdgeInsets.all(1),
                      width: 12,
                      height: 12,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                      child: CircleAvatar(
                        backgroundColor: Colors.green,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              widget.doctor.fullName,
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
            ),
          ],
        ),
        actions: <Widget>[
         
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(Routes.doctorProfile);
            },
            icon: Icon(
              Icons.info,
            ),
          )
        ],
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: StreamBuilder(
                stream: _messagesRef.orderByChild('timestamp').onValue,
                builder: (context, AsyncSnapshot<DatabaseEvent> snapshot) {
                  if (!snapshot.hasData) {
                    return Center(child: CircularProgressIndicator());
                  }
                  DataSnapshot dataValues = snapshot.data!.snapshot;
                  if (dataValues.value == null) {
                    return Center(child: Text('No messages found.'));
                  }
                  Map<dynamic, dynamic> messagesData =
                      dataValues.value as Map<dynamic, dynamic>;

                  var messages = messagesData.entries.toList();
                  messages.sort((a, b) => int.parse(b.value['timestamp'])
                      .compareTo(int.parse(a.value['timestamp'])));

                  return ListView.builder(
                    reverse: true,
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    itemCount: messages.length,
                    itemBuilder: (context, index) {
                      var entry = messages[index];
                      var message = entry.value as Map<dynamic, dynamic>;
                      return Column(
                        children: [
                          SizedBox(height: 10),
                          MessageItem(
                            send: message['sender'] == widget.userModel.id,
                            message: message['text'],
                            pfp: widget.doctor.avatar ??
                                'assets/images/icon_doctor_1.png',
                          ),
                        ],
                      );
                    },
                  );
                }),
          ),
          SafeArea(
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(color: Colors.grey[200]!, width: 0.5),
                ),
              ),
              padding: EdgeInsets.symmetric(vertical: 5),
              child: Row(
                children: <Widget>[
                
                  Expanded(
                    child: TextFormField(
                      controller: _messageController,
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4),
                          borderSide:
                              BorderSide(color: Colors.transparent, width: 0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4),
                          borderSide:
                              BorderSide(color: Colors.transparent, width: 0),
                        ),
                        filled: true,
                        fillColor: Colors.grey[250],
                        contentPadding: EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 10,
                        ),
                        hintText: 'Enter message',
                        hintStyle: TextStyle(
                          color: Colors.grey[400],
                        ),
                      ),
                      autofocus: false,
                      style: TextStyle(
                        color: kColorDarkBlue,
                      ),
                      cursorWidth: 1,
                    ),
                  ),
                  IconButton(
                    onPressed: () async {
                      MessageModel messageModel = MessageModel(
                          id: Timestamp.now().millisecondsSinceEpoch.toString(),
                          text: _messageController.text,
                          sender: widget.userModel.id,
                          receiver: widget.doctor.id,
                          seenBy: "00",
                          timestamp: Timestamp.now()
                              .millisecondsSinceEpoch
                              .toString());
                      await MessageService().sendMessage(messageModel.sender,
                          messageModel.receiver, messageModel);
                      _messageController.text = "";
                    },
                    icon: Icon(
                      Icons.send,
                      size: 25,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class MessageItem extends StatelessWidget {
  final bool send;
  final String message;
  final String pfp;

  const MessageItem(
      {Key? key, required this.send, required this.message, required this.pfp})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: send ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: <Widget>[
        Visibility(
          visible: !send,
          child: CircleAvatar(
            radius: 18,
            backgroundColor: Colors.transparent,
            child: Image.asset(
              pfp,
              fit: BoxFit.fill,
            ),
          ),
        ),
        Flexible(
          child: Container(
            margin: EdgeInsets.only(
              left: !send ? 5 : (MediaQuery.of(context).size.width / 2) - 80,
              right: send ? 5 : (MediaQuery.of(context).size.width / 2) - 80,
            ),
            padding: EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 15,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
                bottomLeft: Radius.circular(send ? 20 : 0),
                bottomRight: Radius.circular(send ? 0 : 20),
              ),
              color: send ? Color(0xffeaf2fe) : kColorBlue,
            ),
            child: SelectableText(
              message,
              style: TextStyle(
                color: send ? kColorDarkBlue : Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.start,
            ),
          ),
        ),
        Visibility(
          visible: send,
          child: CircleAvatar(
            radius: 18,
            backgroundColor: Colors.transparent,
            child: Image.asset(
              'assets/images/icon_man.png',
              fit: BoxFit.fill,
            ),
          ),
        ),
      ],
    );
  }
}
