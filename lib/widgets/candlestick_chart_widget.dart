import 'package:candlestick_chart_flutter/candlestick_custom/canclesticks_custom.dart';
import 'package:candlesticks/candlesticks.dart';
import 'package:flutter/material.dart';

class CandlestickChartWidget extends StatelessWidget {
  final List<Candle> candles;
  const CandlestickChartWidget({Key? key, required this.candles})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 0.86,
      child: CandlesticksCustom(
        candles: candles,
      ),
    );
  }
}
