import 'dart:math';

import 'package:candlesticks/src/models/candle.dart';
import 'package:flutter/material.dart';

import 'chart_custom.dart';

/// StatefulWidget that holds Chart's State (index of
/// current position and candles width).
class CandlesticksCustom extends StatefulWidget {
  final List<Candle> candles;

  CandlesticksCustom({
    required this.candles,
  });

  @override
  _CandlesticksCustomState createState() => _CandlesticksCustomState();
}

/// [CandlesticksCustom] state
class _CandlesticksCustomState extends State<CandlesticksCustom> {
  /// index of the newest candle to be displayed
  /// changes when user scrolls along the chart
  int index = -10;
  ScrollController scrollController = new ScrollController();

  double hoverX = 0.0;
  double hoverY = 0.0;
  bool showInfo = false;

  double lastX = 0;
  int lastIndex = -10;

  void _incrementEnter(PointerEvent details) {
    setState(() {
      showInfo = true;
    });
  }

  void _incrementExit(PointerEvent details) {
    setState(() {
      showInfo = false;
    });
  }

  void _updateLocation(PointerEvent details) {
    setState(() {
      hoverX = details.localPosition.dx;
      hoverY = details.localPosition.dy;
    });
  }

  /// candleWidth controls the width of the single candles.
  ///  range: [2...10]
  double candleWidth = 6;
  final double spaceBetweenHorizontal = 8.47;
  final double spaceBetweenVertical = 34;
  final double gridSize = 1;

  bool showIntervals = false;

  @override
  Widget build(BuildContext context) {
    if (widget.candles.length == 0)
      return Container(
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );
    return Column(
      children: [
        Expanded(
          child: TweenAnimationBuilder(
            tween: Tween(begin: 6.toDouble(), end: candleWidth),
            duration: Duration(milliseconds: 300),
            curve: Curves.easeInOutCirc,
            builder: (_, width, __) {
              return ChartCustom(
                onScaleUpdate: (double scale) {
                  setState(() {
                    candleWidth *= scale;
                    candleWidth = min(candleWidth, 10);
                    candleWidth = max(candleWidth, 2);
                    candleWidth.toInt();
                  });
                },
                onPanEnd: () {
                  lastIndex = index;
                },
                hoverX: hoverX + (index - lastIndex) * candleWidth,
                hoverY: hoverY,
                onEnter: _incrementEnter,
                onHover: _updateLocation,
                onExit: _incrementExit,
                scrollController: scrollController,
                onHorizontalDragUpdate: (double x) {
                  setState(() {
                    x = x - lastX;

                    index = lastIndex + x ~/ candleWidth;
                    index = max(index, -10);
                    index = min(index, widget.candles.length - 1);
                  });
                  if (index == lastIndex) return;
                  scrollController.jumpTo((index + 10) * candleWidth);
                },
                onPanDown: (double value) {
                  lastX = value;
                  lastIndex = index;
                },
                candleWidth: width as double,
                candles: widget.candles,
                index: index,
                spaceBetweenVertical: spaceBetweenVertical,
                spaceBetweenHorizontal: spaceBetweenHorizontal,
                gridSize: gridSize,
              );
            },
          ),
        ),
      ],
    );
  }
}
