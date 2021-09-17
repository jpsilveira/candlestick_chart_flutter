import 'package:candlestick_chart_flutter/shared/color_app.dart';
import 'package:candlestick_chart_flutter/shared/text_app.dart';
import 'package:flutter/material.dart';

class StockMy446_widget extends StatelessWidget {
  final double height;
  final String stockAcronym;
  final String stockName;
  final String stockValue;
  final String stockPercent;

  const StockMy446_widget({
    Key? key,
    required this.height,
    required this.stockAcronym,
    required this.stockName,
    required this.stockValue,
    required this.stockPercent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  stockAcronym,
                  style: TextApp.stockCodeText,
                ),
                Text(
                  stockName,
                  style: TextApp.stockDetailText,
                ),
              ],
            ),
            Center(
              child: Icon(
                Icons.info_outline,
                color: ColorApp.iconLiteColor,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  stockValue,
                  style: TextApp.stockCodeText,
                ),
                Text(
                  '${stockPercent}%',
                  style: TextApp.stockPercentText,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
