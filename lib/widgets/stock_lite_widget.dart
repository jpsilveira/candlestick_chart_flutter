import 'package:candlestick_chart_flutter/shared/color_app.dart';
import 'package:candlestick_chart_flutter/shared/image_app.dart';
import 'package:candlestick_chart_flutter/shared/text_app.dart';
import 'package:flutter/material.dart';

class StockLiteWidget extends StatelessWidget {
  final double height;
  final String stockAcronym;
  final String stockName;
  final String stockValue;
  final String stockPercent;
  final int chartPos;
  final bool hasDivider;
  final bool go446;

  const StockLiteWidget({
    Key? key,
    required this.height,
    required this.stockAcronym,
    required this.stockName,
    required this.stockValue,
    required this.stockPercent,
    this.go446 = false,
    required this.chartPos,
    this.hasDivider = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        padding: EdgeInsets.zero,
      ),
      onPressed: () {
        if (go446) {
          Navigator.pushReplacementNamed(context, "/my446");
        }
      },
      child: Container(
        height: height + 32,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      stockAcronym,
                      style: TextApp.boxLiteTextBold,
                    ),
                    Text(
                      stockName,
                      style: TextApp.boxLiteText,
                    ),
                  ],
                ),
                ShaderMask(
                  shaderCallback: (rect) {
                    return const LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [
                        Colors.transparent,
                        Colors.black,
                        Colors.transparent,
                      ],
                    ).createShader(Rect.fromLTRB(
                      0,
                      0,
                      rect.width,
                      rect.height,
                    ));
                  },
                  blendMode: BlendMode.dstIn,
                  child: Image.asset(
                    chartPos == 0
                        ? ImageApp.iconLineChartUpLeft
                        : chartPos == 1
                            ? ImageApp.iconLineChartUpRight
                            : ImageApp.iconLineChartDownLeft,
                    color: ColorApp.upColor,
                    width: 95,
                    height: 21,
                    fit: BoxFit.contain,
                  ),
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          stockValue,
                          style: TextApp.boxLiteTextBold,
                        ),
                        SizedBox(width: 18),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          '+$stockPercent%',
                          style: TextApp.boxLiteTextUp,
                        ),
                        SizedBox(width: 5),
                        Image.asset(
                          ImageApp.iconArrowUp,
                          color: ColorApp.upColor,
                          width: 13,
                          height: 13,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 16),
            hasDivider == true
                ? Divider(
                    height: 1,
                    color: ColorApp.gridColor,
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
