import 'package:candlestick_chart_flutter/shared/text_app.dart';
import 'package:candlesticks/src/constant/scales.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../shared/color_app.dart';

class PriceColumnCustom extends StatelessWidget {
  const PriceColumnCustom({
    Key? key,
    required this.tileHeight,
    required this.high,
    required this.scaleIndex,
    required this.width,
    required this.height,
    required this.spaceBetweenHorizontal,
    required this.gridSize,
  }) : super(key: key);

  final double tileHeight;
  final double high;
  final int scaleIndex;
  final double width;
  final double height;
  final double spaceBetweenHorizontal;
  final double gridSize;

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      duration: Duration(milliseconds: 400),
      top: 30 - tileHeight / 2,
      child: Container(
        height: height - 60,
        width: width,
        child: ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          itemCount: 100,
          itemBuilder: (context, index) {
            return AnimatedContainer(
              duration: Duration(milliseconds: 400),
              height: tileHeight,
              child: Center(
                child: Row(
                  children: [
                    Container(
                      width: width - 50,
                      height: gridSize,
                      color: ColorApp.gridColor,
                    ),
                    SizedBox(
                      width: spaceBetweenHorizontal,
                    ),
                    Expanded(
                      child: Center(
                        child: Text(
                            "${NumberFormat("###.00", "pt_BR").format((high - scales[scaleIndex] * index))}",
                            // "${(high - scales[scaleIndex] * index).toStringAsFixed(2)}",
                            style: TextApp.priceColumnText),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
