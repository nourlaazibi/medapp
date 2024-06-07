import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:medapp/model/doctor.dart';
import 'package:medapp/model/message.dart';
import 'package:medapp/services/db/booking_db.dart';
import 'package:medapp/services/message_service.dart';
import 'package:timeago/timeago.dart' as timeago;

import '../../routes/routes.dart';
import '../../utils/constants.dart';

class MessagesPage extends StatefulWidget {
  @override
  _MessagesPageState createState() => _MessagesPageState();
}

class _MessagesPageState extends State<MessagesPage>
    with AutomaticKeepAliveClientMixin<MessagesPage> {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    String uid = FirebaseAuth.instance.currentUser!.uid;
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(20),
            child: TextField(
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50),
                  borderSide: BorderSide(color: kColorBlue, width: 0.5),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50),
                  borderSide: BorderSide(color: Colors.grey[300]!, width: 0.5),
                ),
                filled: true,
                fillColor: Colors.grey[250],
                contentPadding: EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 15,
                ),
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.grey[400],
                  size: 20,
                ),
                hintText: 'search_messages'.tr(),
                hintStyle: TextStyle(
                  color: Colors.grey[400],
                ),
              ),
              cursorWidth: 1,
              maxLines: 1,
            ),
          ),
          FutureBuilder(
            future: Future.wait([
              BookingDB().getVisitedDoctors(uid, context),
              MessageService().getRecentMessages(uid, 1)
            ]),
            builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else if (!snapshot.hasData || snapshot.data?[0] == null) {
                return Center(child: Text('No messages found.'));
              } else {
                List<Doctor> doctors = [];
                List<MessageModel> messages = [];
                if (snapshot.data?[0] != null) {
                  doctors = snapshot.data?[0];
                }
                if (snapshot.data?[1] != null) {
                  messages = snapshot.data?[1];
                }

                return ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: doctors.length,
                  itemBuilder: (context, index) {
                    final doctor = doctors[index];
                    String _ids = uid + doctor.id;
                    MessageModel message = messages.firstWhere(
                      (element) =>
                          _ids.contains(element.sender) ||
                          _ids.contains(element.receiver),
                      orElse: () => MessageModel(
                          id: "id",
                          text: "Start Chatting",
                          sender: doctor.id,
                          receiver: uid,
                          seenBy: "00",
                          timestamp: DateTime.now()),
                    );
                    String timeAgo = timeago.format(message.timestamp);
                    return MessageListItem(
                      onTap: () {
                        Navigator.of(context).pushNamed(Routes.chatDetail);
                      },
                      imagePath: doctor.avatar!,
                      name: doctor.fullName,
                      message: message.text,
                      date: timeAgo,
                      unread: 1,
                      online: false,
                    );
                  },
                );
              }
            },
          ),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

class MessageListItem extends StatelessWidget {
  final void Function() onTap;
  final String imagePath;
  final String name;
  final String message;
  final String date;
  final int? unread;
  final bool online;

  const MessageListItem({
    Key? key,
    required this.onTap,
    required this.imagePath,
    required this.name,
    required this.message,
    required this.date,
    this.unread,
    required this.online,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Row(
          children: <Widget>[
            Container(
              width: 50,
              height: 50,
              child: Stack(
                children: <Widget>[
                  CircleAvatar(
                    radius: 25,
                    backgroundColor: Colors.transparent,
                    child: Image.asset(
                      imagePath,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Visibility(
                    visible: online,
                    child: Align(
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
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    name,
                    style: Theme.of(context).textTheme.subtitle2!.copyWith(
                          fontWeight: FontWeight.w700,
                        ),
                  ),
                  Text(
                    message,
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 5,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Text(
                  date,
                  style: TextStyle(
                    color: kColorPrimary,
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Visibility(
                  visible: (unread != 0 && unread != null) ? true : false,
                  maintainSize: true,
                  maintainAnimation: true,
                  maintainState: true,
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      vertical: 2,
                      horizontal: 7,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: kColorPrimary,
                    ),
                    child: Text(
                      unread.toString(),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
