import 'package:al_pay_flutter/pages/index/home_layout.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Color(0xff3c82cb),
        scaffoldBackgroundColor: Color(0xfff5f5f5),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomeLayout(),
    );
  }
}
