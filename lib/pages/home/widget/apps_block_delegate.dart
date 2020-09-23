import 'package:al_pay_flutter/pages/home/widget/apps_block.dart';
import 'package:flutter/material.dart';

class AppsBlockDelegate extends SliverPersistentHeaderDelegate {
  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      child: AppsBlock(),
    );
  }

  @override
  double get maxExtent => 210;

  @override
  double get minExtent => 210;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
  
}