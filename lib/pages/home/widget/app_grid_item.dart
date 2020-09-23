
import 'package:flutter/material.dart';
class AppGridItem extends StatelessWidget {
  AppGridItem({
    this.codePoint,
    this.iconColor,
    this.title
  });

  int codePoint;
  Color iconColor;
  String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: 70,
      width: MediaQuery.of(context).size.width / 4,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 6),
            child: Icon(IconData(codePoint, fontFamily: 'iconFont'), size: 30, color: iconColor ?? Theme.of(context).primaryColor,),
          ),
          Container(
            child: Text(title, style: TextStyle(
              fontSize: 12
            ),),
          )
        ],
      ),
    );
  }
}