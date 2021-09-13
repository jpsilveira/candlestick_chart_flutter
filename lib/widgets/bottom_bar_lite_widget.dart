import 'package:candlestick_chart_flutter/shared/color_app.dart';
import 'package:candlestick_chart_flutter/shared/image_app.dart';
import 'package:candlestick_chart_flutter/shared/text_app.dart';
import 'package:flutter/material.dart';

class BottomBarLiteWidget extends StatelessWidget {
  const BottomBarLiteWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: 48,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          Container(
            decoration: BoxDecoration(
                color: ColorApp.barLiteBox,
                borderRadius: BorderRadius.circular(8)),
            width: 127,
            child: TextButton(
              style: TextButton.styleFrom(
                padding: EdgeInsets.zero,
              ),
              onPressed: () {},
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "COMPRAR ",
                    style: TextApp.secondBarPercentText,
                  ),
                  Image.asset(
                    ImageApp.iconStraitArrowUp,
                    color: ColorApp.upColor,
                    width: 12,
                    height: 12,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(width: 10),
          Container(
            decoration: BoxDecoration(
                color: ColorApp.barLiteBox,
                borderRadius: BorderRadius.circular(8)),
            width: 127,
            child: TextButton(
              style: TextButton.styleFrom(
                padding: EdgeInsets.zero,
              ),
              onPressed: () {},
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "VENDER ",
                    style: TextApp.secondBarPercentText,
                  ),
                  Image.asset(
                    ImageApp.iconStraitArrowDown,
                    color: ColorApp.dnColor,
                    width: 12,
                    height: 12,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(width: 10),
          Container(
            decoration: BoxDecoration(
                color: ColorApp.barLiteBox,
                borderRadius: BorderRadius.circular(8)),
            width: 127,
            child: TextButton(
              style: TextButton.styleFrom(
                padding: EdgeInsets.zero,
              ),
              onPressed: () {},
              child: Text(
                "CHAT",
                style: TextApp.secondBarPercentText,
              ),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Container(
            decoration: BoxDecoration(
                color: ColorApp.barLiteBox,
                borderRadius: BorderRadius.circular(8)),
            width: 127,
            child: TextButton(
              style: TextButton.styleFrom(
                padding: EdgeInsets.zero,
              ),
              onPressed: () {},
              child: Text(
                "SUPORTE",
                style: TextApp.secondBarPercentText,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
