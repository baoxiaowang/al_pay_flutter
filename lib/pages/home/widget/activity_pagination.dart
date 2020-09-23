import 'package:flutter/material.dart';
class ActivityPageination extends StatelessWidget {
  ActivityPageination({
    this.count,
    this.activeIndex
  });
  int count;
  int activeIndex;
  @override
  Widget build(BuildContext context) {
    var children = List.generate(count, (index) => Container(
      height: 3,
      width: activeIndex == index ? 12 : 4,
      margin: EdgeInsets.symmetric(
        horizontal: 3
      ),
      color: activeIndex == index ? Theme.of(context).primaryColor : Color(0xffeeeeee),
    )).toList();
    return Container(
      // color: Colors.red,
      alignment:  Alignment.bottomCenter,
      child: Container(
        padding: EdgeInsets.only(bottom: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: children,
        ),
      )
    );
  }
}