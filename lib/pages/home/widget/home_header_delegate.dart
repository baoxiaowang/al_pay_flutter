import 'package:flutter/material.dart';
import 'dart:math' as math;
class HomeHeaderDelegate extends SliverPersistentHeaderDelegate {

  Widget _search (){
    return Container(
      height: 28,
      color: Colors.white,
      margin: EdgeInsets.only(
        right: 12
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 10,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(right: 6),
            child: Icon(IconData(0xe602, fontFamily: 'iconfont'), size: 12, color: Color(0xff666666)),
          ),
          Expanded(child: Container(
            child: Text('健康码', style: TextStyle(
              fontSize: 14,
              color: Color(0xff666666)
            ),),
          )),
        ],
      ),
    );
  }

  Widget _explanHead (){
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: 12
      ),
      child: Row(
        children: [
          Expanded(child: _search(),),
          Container(
            margin: EdgeInsets.symmetric(
              horizontal: 8
            ),
            child: Icon(Icons.person_outline, size: 28, color: Colors.white,),
          ),
          Container(
            margin: EdgeInsets.only(
              left: 8
            ),
            child: Icon(Icons.add, size: 28, color: Colors.white),
          )
        ],
      ),
    );
  }

  Widget _collapseHeader(){
    return Container(
      height: 28,
      padding: EdgeInsets.symmetric(
        horizontal: 10,
      ),
      margin: EdgeInsets.only(top: 5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _collapseItem(0xe67c),
          _collapseItem(0xe7a5),
          _collapseItem(0xe604),
          _collapseItem(0xe602),
          Expanded(child: Container(
            margin: EdgeInsets.only(right: 5),
            alignment: Alignment.centerRight,
              child: Icon(IconData(0xe647, fontFamily: 'iconFont'), size: 25, color: Colors.white),
            )
          ) 
        ],
      ),
    );
  }
  Widget _collapseItem(codePoint){
    return Container(
      margin: EdgeInsets.only(right: 30),
      child: Icon(IconData(codePoint, fontFamily: 'iconFont'), size: 22, color: Colors.white,),
    );
  }
  Widget _bodyItem(codePoint, title){
    return Container(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 10),
            child: Icon(IconData(codePoint, fontFamily: 'iconFont'), size: 35, color: Colors.white,),
          ),
          Container(
            child: Text(title, style: TextStyle(
              color: Colors.white
            ),),
          )
        ],
      ),
    );
  }
  
  Widget _body(){
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 8
      ),
      width: double.infinity,
      child: Row(
        children: [
          Expanded(child: _bodyItem(0xe67c, '扫一扫'),),
          Expanded(child: _bodyItem(0xe7a5, '付钱'),),
          Expanded(child: _bodyItem(0xe604, '收钱'),),
          Expanded(child: _bodyItem(0xe611, '卡包'),),
        ],
      ),
    );
  }

  double _getCollapsePadding(double t, {double maxExtent , double minExtent }) {
    final double deltaExtent = maxExtent - minExtent;
    return -Tween<double>(begin: 0.0, end: deltaExtent / 3.0).transform(t);
  }

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    double currentExtent = math.max(minExtent, maxExtent - shrinkOffset);
    final double deltaExtent = maxExtent - minExtent;
    final double t = (1.0 - (currentExtent - minExtent) / deltaExtent).clamp(0.0, 1.0) as double;
    final double opacity = Tween<double>(begin: 1, end: 0).transform(t);
    var explanHead  = Positioned(
      top: 5,
      left: 0,
      right: 0,
      child: AnimatedCrossFade(
        duration: Duration(milliseconds: 200),
        crossFadeState: opacity > 0.5 ? CrossFadeState.showFirst : CrossFadeState.showSecond,
        firstChild: Opacity(
          opacity: opacity,
          child: _explanHead(),
        ),
        secondChild: _collapseHeader(),
      ) 
    );
    var body = Positioned(
      // top: 45,
      top: _getCollapsePadding(t, maxExtent: maxExtent, minExtent: minExtent) + 45,
      left: 0,
      right: 0,
      child: Opacity(
        opacity: opacity,
        child: _body(),
      )
    );
    return Container(
      color: Theme.of(context).primaryColor,
      height: maxExtent,
      child: SafeArea(
        child: Stack(
          fit: StackFit.expand,
          children: [
            explanHead,
            body
          ],
        ),
      ),
    );
  }
  
  @override
  double get maxExtent => 170;

  @override
  double get minExtent => 98;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }

}