import 'package:flutter/material.dart';

import '../../routes/routes.dart';
import '../../utils/constants.dart';

class MessagesDetailPage extends StatefulWidget {
  @override
  _MessagesDetailPageState createState() => _MessagesDetailPageState();
}

class _MessagesDetailPageState extends State<MessagesDetailPage> {
  @override
  Widget build(BuildContext context) {
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
                      'assets/images/icon_doctor_1.png',
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
              'Tawfiq Bahri',
              style: Theme.of(context).textTheme.subtitle2!.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
            ),
          ],
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.phone,
            ),
          ),
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
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 10,
                    ),
                    MessageItem(
                      send: false,
                      message: 'Hello',
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    MessageItem(
                      send: true,
                      message: 'Hello Doctor \nHow are you?',
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    MessageItem(
                      send: false,
                      message: 'Fine \nI hope you\'re doing well.',
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    MessageItem(
                      send: false,
                      message: 'Don\'t forget about your next appointment.',
                    ),
                  ],
                ),
              ),
            ),
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
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.attach_file,
                      size: 25,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.camera_alt,
                      size: 25,
                    ),
                  ),
                  Expanded(
                    child: TextFormField(
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
                    onPressed: () {},
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

  const MessageItem({Key? key, required this.send, required this.message})
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
              'assets/images/icon_doctor_1.png',
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
