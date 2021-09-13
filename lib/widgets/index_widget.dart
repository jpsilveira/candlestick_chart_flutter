import 'package:candlestick_chart_flutter/shared/color_app.dart';
import 'package:candlestick_chart_flutter/shared/image_app.dart';
import 'package:candlestick_chart_flutter/shared/text_app.dart';
import 'package:flutter/material.dart';

class IndexWidget extends StatelessWidget {
  const IndexWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "ÍNDICES",
          style: TextApp.indexLiteText,
        ),
        const SizedBox(height: 20),
        Container(
          width: double.maxFinite,
          height: 70,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              Container(
                decoration: BoxDecoration(
                    color: ColorApp.barLiteBoxSelected,
                    borderRadius: BorderRadius.circular(8)),
                width: 140,
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 17,
                    left: 17,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "IBOV",
                        style: TextApp.indexLiteText,
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Text(
                            "-1,23% ",
                            style: TextApp.indexBarPercentText,
                          ),
                          Image.asset(
                            ImageApp.iconArrowDown,
                            color: ColorApp.iconLiteColor,
                            width: 13,
                            height: 13,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(width: 8),
              Container(
                decoration: BoxDecoration(
                    color: ColorApp.barLiteBox,
                    borderRadius: BorderRadius.circular(8)),
                width: 140,
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 17,
                    left: 17,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "IBRX 100",
                        style: TextApp.indexLiteText,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Text(
                            "-0,94% ",
                            style: TextApp.indexDownLiteText,
                          ),
                          Image.asset(
                            ImageApp.iconArrowDown,
                            color: ColorApp.dnColor,
                            width: 13,
                            height: 13,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(width: 8),
              Container(
                decoration: BoxDecoration(
                    color: ColorApp.barLiteBox,
                    borderRadius: BorderRadius.circular(8)),
                width: 140,
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 17,
                    left: 17,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "IBOV",
                        style: TextApp.indexLiteText,
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Text(
                            "-0,97% ",
                            style: TextApp.indexDownLiteText,
                          ),
                          Image.asset(
                            ImageApp.iconArrowDown,
                            color: ColorApp.dnColor,
                            width: 13,
                            height: 13,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
