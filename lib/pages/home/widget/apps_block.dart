import 'package:al_pay_flutter/pages/home/widget/app_grid_item.dart';
import 'package:flutter/material.dart';

class AppsBlock extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Wrap(
        children: [
          AppGridItem(
            codePoint: 0xe619,
            title: '转账',
          ),
          AppGridItem(
            codePoint: 0xe60c,
            title: '花呗',
          ),
          AppGridItem(
            codePoint: 0xe6b0,
            title: '生活缴费',
          ),
          AppGridItem(
            codePoint: 0xe60a,
            title: '余额宝',
            iconColor: Color(0xffe76459),
          ),
          AppGridItem(
            codePoint: 0xe643,
            title: '火车票机票',
          ),
          AppGridItem(
            codePoint: 0xe6fc,
            title: '共享单车',
          ),
          AppGridItem(
            codePoint: 0xe665,
            title: '借呗',
            iconColor: Color(0xff3c82cb),
          ),
          AppGridItem(
            codePoint: 0xe65b,
            title: '滴滴出行',
            iconColor: Color(0xffef9947),
          ),
          AppGridItem(
            codePoint: 0xe679,
            title: '小程序',
          ),
          AppGridItem(
            codePoint: 0xe622,
            title: '充值中心',
            iconColor: Color(0xffef9947),
          ),
          AppGridItem(
            codePoint: 0xe6f9,
            title: '健康码',
          ),
          AppGridItem(
            codePoint: 0xe795,
            title: '更多',
            iconColor: Color(0xffbbbbbb),
          )
        ],
      ),
    );
  }
}
