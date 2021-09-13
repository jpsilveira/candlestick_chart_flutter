import 'package:candlestick_chart_flutter/shared/image_app.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 5),
        () => Navigator.pushReplacementNamed(context, "/lite"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          Center(
              child: Image.asset(
            ImageApp.iconSplash,
            height: double.maxFinite,
            width: double.maxFinite,
          )),
        ],
      ),
    );
  }
}
