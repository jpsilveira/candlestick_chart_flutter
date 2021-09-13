import 'package:candlestick_chart_flutter/pages/my_446_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'lite_page.dart';
import 'splash_page.dart';

class AppWidget extends StatelessWidget {
  AppWidget({Key? key}) : super(key: key) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp],
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Trade Evolution',
      initialRoute: "/splash",
      routes: {
        "/splash": (context) => SplashPage(),
        "/lite": (context) => LitePage(),
        "/my446": (context) => My446Page(),
      },
    );
  }
}
