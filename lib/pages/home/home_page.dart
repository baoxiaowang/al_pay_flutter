import 'package:al_pay_flutter/pages/home/widget/activity_swiper.dart';
import 'package:al_pay_flutter/pages/home/widget/home_header_delegate.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'widget/apps_block_delegate.dart';
import 'widget/other_panel.dart';
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {



  Widget _notice(){
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      padding: EdgeInsets.symmetric(
        vertical: 8
      ),
      child: Container(
        height: 66,
        color: Colors.white,
        padding: EdgeInsets.symmetric(
          horizontal: 10
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(right: 6),
              child: Image.asset('assets/images/mayi.jpg'),
            ),
            Expanded(
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RichText(
                      text: TextSpan(
                        style: DefaultTextStyle.of(context).style,
                        children: <InlineSpan>[
                          TextSpan(text: '·  余额宝收益到账啦', style: TextStyle(
                            fontSize: 13
                          )),
                          TextSpan(
                            text: '  刚刚',
                            style: TextStyle(
                              color: Color(0xff999999),
                              fontSize: 13
                            ),
                          ),
                        ]
                      ),
                    ),
                    RichText(
                      text: TextSpan(
                        style: DefaultTextStyle.of(context).style,
                        children: <InlineSpan>[
                          TextSpan(text: '·  你参与的公益项目有新进展', style: TextStyle(
                            fontSize: 13
                          )),
                          TextSpan(
                            text: '  1小时前',
                            style: TextStyle(
                              color: Color(0xff999999),
                              fontSize: 13
                            ),
                          ),
                        ]
                      ),
                    ),
                    // Text('·  余额宝收益到账啦'),
                    // Text('·  你参与的公益项目有新进展')
                  ],
                ),
              )
            ),
            Container(
              child: Icon(Icons.chevron_right, color: Color(0xff999999),),
            )
          ],
        ),
      ),
    );
  }
  Widget _panelItem(title, memo, url){
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 10
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: TextStyle(
                    fontSize: 15,
                    color: Colors.black87,
                    fontWeight: FontWeight.w500
                  ),),
                  Text(memo, style: TextStyle(
                    fontSize: 13,
                    color: Color(0xff666666)
                  ),)
                ],
              ),
            )
          ),
          Container(
            width: 55,
            child: Image.asset(url),
          )
        ],
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarBrightness: Brightness.dark,
      statusBarIconBrightness: Brightness.dark,
    ));
    return Scaffold(
      body: EasyRefresh.builder(
        header: BallPulseHeader(
          enableHapticFeedback: false,
          color: Theme.of(context).primaryColor
        ),
        onRefresh: (){
          return Future.value(10);

        },
        builder: (context, physics, header, footer){
          return Container(
            color: Theme.of(context).scaffoldBackgroundColor,
            child: CustomScrollView(
              slivers: [
                SliverPersistentHeader(
                  pinned: true,
                  delegate: HomeHeaderDelegate()
                ),
                SliverPersistentHeader(
                  delegate: AppsBlockDelegate()
                ),
                header,
                SliverToBoxAdapter(
                  child: _notice(),
                ),
                SliverToBoxAdapter(
                  child: ActivitySwiper(),
                ),
                SliverToBoxAdapter(
                  child: OtherPanel(
                    title: '抗击新冠肺炎',
                    child: Container(
                      child: Card(
                        shadowColor: Color(0xffeeeeee),
                        child:Column(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      border: Border(
                                        right: BorderSide(
                                          color: Color(0xffeeeeee)
                                        ),
                                        bottom: BorderSide(
                                          color: Color(0xffeeeeee)
                                        ),
                                      )
                                    ),
                                    height: 80,
                                    child: _panelItem('实时数据', '疫情动态追踪', 'assets/images/p2.jpg'),
                                  )
                                ),
                                Expanded(
                                  child: Container(
                                    height: 80,
                                    decoration: BoxDecoration(
                                      border: Border(
                                        bottom: BorderSide(
                                          color: Color(0xffeeeeee)
                                        ),
                                      )
                                    ),
                                    child: _panelItem('滚动资讯', '实时权威发布', 'assets/images/p4.jpg'),
                                  )
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      border: Border(
                                        right: BorderSide(
                                          color: Color(0xffeeeeee)
                                        ),
                                      )
                                    ),
                                    height: 80,
                                    child: _panelItem('宅家也能买菜', '新鲜蔬菜送上门', 'assets/images/p5.jpg'),
                                  )
                                ),
                                Expanded(
                                  child: Container(
                                    height: 80,
                                    child: _panelItem('健康大药房', '实时补货中', 'assets/images/p6.jpg'),
                                  )
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: OtherPanel(
                    title: '惠支付',
                    child: Card(
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border(
                                  right: BorderSide(
                                    color: Color(0xffeeeeee)
                                  ),
                                )
                              ),
                              height: 80,
                              child: _panelItem('健康金天天领', '免费领健康保额', 'assets/images/p1.jpg'),
                            )
                          ),
                          Expanded(
                            child: Container(
                              height: 80,
                              child: _panelItem('赚钱红包升级', '通知好友来领取', 'assets/images/p3.jpg'),
                            )
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Container(
                    // height: 40,
                    color: Colors.white,
                    padding: EdgeInsets.symmetric(
                      horizontal: 50,
                      vertical: 40
                    ),
                    child: Row(
                      children: [
                        Expanded(child: Divider()),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Text('我是有底线的', style: TextStyle(
                            color: Color(0xff666666),
                            fontSize: 12
                          ),),
                        ),
                        Expanded(child: Divider())
                      ],
                    ),
                  ),
                )
              ],
            ),
          );
        }
      ),
    );
  }
}

