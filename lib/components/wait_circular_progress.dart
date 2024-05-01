import 'package:flutter/material.dart';

class WaitCircularProgress extends StatelessWidget {
  final String title;

  const WaitCircularProgress({Key? key, required this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      height: 100,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: Row(
        children: <Widget>[
          SizedBox(
            width: 30,
            height: 30,
            child: CircularProgressIndicator(),
          ),
          SizedBox(
            width: 20,
          ),
          Text(
            title,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w400,
              fontFamily: 'Poppins-Medium',
            ),
          ),
        ],
      ),
    );
  }
}
