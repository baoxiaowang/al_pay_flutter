import 'package:flutter/material.dart';
class OtherPanel extends StatelessWidget {
  OtherPanel({
    this.title,
    this.child
  });
  String title;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            child: Text(title, style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500
            )),
          ),
          Container(
            child: child,
          )
        ],
      ),
    );
  }
}