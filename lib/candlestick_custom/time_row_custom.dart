import 'package:candlesticks/candlesticks.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../shared/color_app.dart';
import '../shared/text_app.dart';

class TimeRowCustom extends StatelessWidget {
  final List<Candle> candles;
  final double candleWidth;
  final ScrollController scrollController;
  final double indicatorX;
  final DateTime indicatorTime;
  final double spaceBetweenVertical;
  final double gridSize;
  const TimeRowCustom({
    Key? key,
    required this.candles,
    required this.candleWidth,
    required this.scrollController,
    required this.indicatorX,
    required this.indicatorTime,
    required this.spaceBetweenVertical,
    required this.gridSize,
  }) : super(key: key);

  /// Calculates number of candles between two time indicator
  int _stepCalculator() {
    if (candleWidth < 3)
      return 31;
    else if (candleWidth < 5)
      return 19;
    else if (candleWidth < 7)
      return 13;
    else
      return 9;
  }

  /// Calculates [DateTime] of a given candle index
  DateTime _timeCalculator(int step, int index, Duration dif) {
    int candleNumber = (step + 1) ~/ 2 - 10 + index * step + -1;
    DateTime? _time;
    if (candleNumber < 0)
      _time = candles[step + candleNumber].date.add(dif);
    else if (candleNumber < candles.length)
      _time = candles[candleNumber].date;
    else {
      final stepsBack = (candleNumber - candles.length) ~/ step + 1;
      final newIndex = candleNumber - stepsBack * step;
      _time = candles[newIndex].date.subtract(dif * stepsBack);
    }
    return _time;
  }

  /// Fomats number as 2 digit integer
  String numberFormat(int value) {
    return "${value < 10 ? 0 : ""}$value";
  }

  /// Day/month text widget
  Text _monthDayText(DateTime _time) {
    return Text(
      numberFormat(_time.day) + "/" + numberFormat(_time.month),
      style: TextApp.dateTimeText,
    );
  }

  /// Hour/minute text widget
  Text _hourMinuteText(DateTime _time) {
    return Text(
      numberFormat(_time.hour) + ":" + numberFormat(_time.minute),
      style: TextApp.dateTimeText,
    );
  }

  String dateFormatter(DateTime date) {
    return "${date.year}-${numberFormat(date.month)}-${numberFormat(date.day)} ${numberFormat(date.hour)}:${numberFormat(date.minute)}";
  }

  @override
  Widget build(BuildContext context) {
    int step = _stepCalculator();
    final dif = candles[0].date.difference(candles[step].date);
    return Padding(
      padding: const EdgeInsets.only(right: 51.0),
      child: Stack(
        children: [
          ListView.builder(
            itemCount: candles.length,
            scrollDirection: Axis.horizontal,
            controller: scrollController,
            itemExtent: step * candleWidth,
            reverse: true,
            itemBuilder: (context, index) {
              DateTime _time = _timeCalculator(step, index, dif);
              return Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Container(
                      width: gridSize,
                      color: ColorApp.gridColor,
                    ),
                  ),
                  Container(
                    color: ColorApp.bgColor446,
                    child: Column(
                      children: [
                        Container(
                          height: spaceBetweenVertical,
                        ),
                        _monthDayText(_time),
                        _hourMinuteText(_time)
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
