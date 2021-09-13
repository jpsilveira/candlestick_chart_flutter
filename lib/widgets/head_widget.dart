import 'package:candlestick_chart_flutter/shared/color_app.dart';
import 'package:candlestick_chart_flutter/shared/image_app.dart';
import 'package:candlestick_chart_flutter/shared/text_app.dart';
import 'package:flutter/material.dart';

import 'image_button_widget.dart';

class HeadWidget extends StatefulWidget {
  final bool evolutionPro;
  const HeadWidget({Key? key, required this.evolutionPro}) : super(key: key);

  @override
  _HeadWidgetState createState() => _HeadWidgetState();
}

class _HeadWidgetState extends State<HeadWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 31,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ImageButtonWidget(
            width: 23,
            height: 23,
            padding: EdgeInsets.zero,
            image: ImageApp.iconUser,
            color: ColorApp.iconLiteColor,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "OLÁ PAULA",
                style: TextApp.userLiteText,
              ),
              Text(
                widget.evolutionPro
                    ? "Trader Evolution PRO"
                    : "Trader Evolution Lite",
                style: TextApp.accountLiteText,
              )
            ],
          ),
          ImageButtonWidget(
            width: 23,
            height: 23,
            padding: EdgeInsets.zero,
            image: ImageApp.iconChat,
            color: ColorApp.iconLiteColor,
          ),
        ],
      ),
    );
  }
}
