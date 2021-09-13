import 'package:candlestick_chart_flutter/shared/color_app.dart';
import 'package:candlestick_chart_flutter/shared/image_app.dart';
import 'package:flutter/material.dart';

class BottomBarMy446Widget extends StatelessWidget {
  const BottomBarMy446Widget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorApp.bgColor446,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          TextButton(
            style: TextButton.styleFrom(
              padding: EdgeInsets.zero,
            ),
            onPressed: () {},
            child: Image.asset(
              ImageApp.iconClock,
              color: ColorApp.icon446Color,
              width: 16,
              height: 16,
            ),
          ),
          TextButton(
            style: TextButton.styleFrom(
              padding: EdgeInsets.zero,
            ),
            onPressed: () {},
            child: Image.asset(
              ImageApp.iconCandlestick,
              color: ColorApp.icon446Color,
              width: 16,
              height: 16,
            ),
          ),
          TextButton(
            style: TextButton.styleFrom(
              padding: EdgeInsets.zero,
            ),
            onPressed: () {},
            child: Image.asset(
              ImageApp.iconChart,
              color: ColorApp.icon446Color,
              width: 16,
              height: 16,
            ),
          ),
          TextButton(
            style: TextButton.styleFrom(
              padding: EdgeInsets.zero,
            ),
            onPressed: () {},
            child: Image.asset(
              ImageApp.iconEdit,
              color: ColorApp.icon446Color,
              width: 16,
              height: 16,
            ),
          ),
          TextButton(
            style: TextButton.styleFrom(
              padding: EdgeInsets.zero,
            ),
            onPressed: () {},
            child: Image.asset(
              ImageApp.iconMoney,
              color: ColorApp.icon446Color,
              width: 16,
              height: 16,
            ),
          ),
        ],
      ),
    );
  }
}
