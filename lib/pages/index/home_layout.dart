import 'package:al_pay_flutter/pages/home/home_page.dart';
import 'package:flutter/material.dart';

class HomeLayout extends StatelessWidget {
  PageController _pageController;
  @override
  Widget build(BuildContext context) {
    _pageController = PageController();
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: [
          HomePage(),
          HomePage()
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        iconSize: 24,
        selectedFontSize: 12,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Theme.of(context).primaryColor,
        unselectedItemColor: Color(0xffbbbbbb),
        items: [
          _getBarItem(0xe65e, '首页'),
          _getBarItem(0xe603, '财富'),
          _getBarItem(0xe618, '口碑'),
          _getBarItem(0xe61a, '朋友'),
          _getBarItem(0xe621, '我的'),
        ],
      ),
    );
  }

  BottomNavigationBarItem _getBarItem(int codePoint, String title){
    return BottomNavigationBarItem(
      icon: Icon(IconData(codePoint, fontFamily: 'iconFont'), size: 24,),
      title: Text(title, style: TextStyle(
        // color: Color(0xffbbbbbb),
        fontSize: 12
      ),)
    );
  }
}