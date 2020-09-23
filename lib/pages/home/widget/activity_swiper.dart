import 'package:al_pay_flutter/pages/home/widget/activity_pagination.dart';
import 'package:flutter/material.dart';
import 'package:flutter_page_indicator/flutter_page_indicator.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
// import 'package:flutter_swiper/flutter_page_indicator.dart';
class ActivitySwiper extends StatefulWidget {
  @override
  _ActivitySwiperState createState() => _ActivitySwiperState();
}

class _ActivitySwiperState extends State<ActivitySwiper> {
  List<String> images = const [
    'assets/images/swiper1.jpg',
    'assets/images/swiper2.jpg',
    'assets/images/swiper3.jpg',
    'assets/images/swiper4.jpg'
  ];
  
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      color: Theme.of(context).scaffoldBackgroundColor,
      padding: EdgeInsets.only(bottom: 8),
      child: Swiper(
        autoplay: true,
        itemBuilder: (BuildContext context, int index) {
          return new Image.asset(
            images[index],
            fit: BoxFit.fill,
          );
        },
        // swiperPlugin: 
        itemCount: images.length,
        scrollDirection: Axis.horizontal,
        // pagination: new SwiperPagination(alignment: Alignment.bottomCenter),
        pagination:new SwiperCustomPagination(
          builder:(BuildContext context, SwiperPluginConfig config){
            print(context);
            print(config);
            return  ActivityPageination(
              count: config.itemCount,
              activeIndex: config.activeIndex,
            );
          }
        )
        // control: new SwiperControl(),
        // pagination: SwiperPagination()
      ),
    );
  }
}