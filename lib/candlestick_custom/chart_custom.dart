import 'dart:math';

import 'package:candlesticks/candlesticks.dart';
import 'package:candlesticks/src/constant/scales.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:intl/intl.dart';

import '../shared/color_app.dart';
import '../shared/text_app.dart';
import 'candle_stick_widget_custom.dart';
import 'price_column_custom.dart';
import 'time_row_custom.dart';

/// This widget manages gestures
/// Calculates the highest and lowest price of visible candles.
/// Updates right-hand side numbers.
/// And pass values down to [CandleStickWidget].
class ChartCustom extends StatelessWidget {
  /// onScaleUpdate callback
  /// called when user scales chart using buttons or scale gesture
  final Function onScaleUpdate;

  /// scrollController controlls the horizontal time row
  final ScrollController scrollController;

  /// onHorizontalDragUpdate
  /// callback calls when user scrolls horizontally along the chart
  final Function onHorizontalDragUpdate;

  /// candleWidth controls the width of the single candles.
  /// range: [2...10]
  final double candleWidth;

  /// list of all candles to display in chart
  final List<Candle> candles;

  /// index of the newest candle to be displayed
  /// changes when user scrolls along the chart
  final int index;

  final void Function(PointerEvent) onEnter;

  final void Function(PointerEvent) onHover;

  final void Function(PointerEvent) onExit;

  final double hoverX;
  final double hoverY;

  final void Function(double) onPanDown;
  final void Function() onPanEnd;

  final double spaceBetweenHorizontal;
  final double spaceBetweenVertical;
  final double gridSize;

  ChartCustom({
    required this.onScaleUpdate,
    required this.onHorizontalDragUpdate,
    required this.candleWidth,
    required this.candles,
    required this.index,
    required this.scrollController,
    required this.onEnter,
    required this.onExit,
    required this.onHover,
    required this.hoverX,
    required this.onPanDown,
    required this.onPanEnd,
    required this.hoverY,
    required this.spaceBetweenHorizontal,
    required this.spaceBetweenVertical,
    required this.gridSize,
  });

  double log10(num x) => log(x) / ln10;

  double getRoof(double number) {
    int log = log10(number).floor();
    return (number ~/ pow(10, log) + 1) * pow(10, log).toDouble();
  }

  String priceToString(double price) {
    int log = log10(price).floor();
    if (log > 9)
      return "${price ~/ 1000000000}B";
    else if (log > 6)
      return "${price ~/ 1000000}M";
    else if (log > 3)
      return "${price ~/ 1000}K";
    else
      return "${price.toStringAsFixed(0)}";
  }

  String numberFormat(int value) {
    return "${value < 10 ? 0 : ""}$value";
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double high = 0;
        double low = double.infinity;
        for (int i = 0;
            (i + 1) * candleWidth < constraints.maxWidth - 50;
            i++) {
          if (i + index >= candles.length || i + index < 0) continue;
          low = min(candles[i + index].low, low);
          high = max(candles[i + index].high, high);
        }
        double tileHeight = 0;
        int scaleIndex = 0;
        final maxHeight = constraints.maxHeight - 20;
        double chartHeight = maxHeight * 3 / 4 - 40;
        for (int i = 0; i < scales.length; i++) {
          double newHigh = ((high ~/ scales[i] + 1) * scales[i]).toDouble();
          double newLow = ((low ~/ scales[i]) * scales[i]).toDouble();
          double range = newHigh - newLow;
          if (chartHeight / (range / scales[i]) > 30) {
            tileHeight = chartHeight / (range / scales[i]);
            scaleIndex = i;
            break;
          }
        }

        high =
            ((high ~/ scales[scaleIndex] + 1) * scales[scaleIndex]).toDouble();
        low = ((low ~/ scales[scaleIndex]) * scales[scaleIndex]).toDouble();

        double volumeHigh = 0;
        for (int i = 0;
            (i + 1) * candleWidth < constraints.maxWidth - 50;
            i++) {
          if (i + index >= candles.length || i + index < 0) continue;
          volumeHigh = max(candles[i + index].volume, volumeHigh);
        }

        return TweenAnimationBuilder(
          tween: Tween(begin: low, end: high),
          duration: Duration(milliseconds: 200),
          builder: (context, high, _) {
            return TweenAnimationBuilder(
              tween: Tween(begin: low, end: low),
              duration: Duration(milliseconds: 200),
              builder: (context, low, _) {
                return Container(
                  color: ColorApp.bgColor446,
                  child: Stack(
                    children: [
                      Column(
                        children: [
                          Expanded(
                            flex: 3,
                            child: Stack(
                              children: [
                                PriceColumnCustom(
                                  tileHeight: tileHeight,
                                  high: high as double,
                                  scaleIndex: scaleIndex,
                                  width: constraints.maxWidth,
                                  height: constraints.maxHeight,
                                  spaceBetweenHorizontal:
                                      spaceBetweenHorizontal,
                                  gridSize: gridSize,
                                ),
                                AnimatedPositioned(
                                  duration: Duration(microseconds: 300),
                                  right: 0,
                                  top: maxHeight * 3 / 4 -
                                      30 -
                                      ((candles[index >= 0 ? index : 0].close -
                                                  (low as double)) /
                                              (high - low)) *
                                          (maxHeight * 3 / 4 - 40),
                                  child: Row(
                                    children: [
                                      Container(
                                        width: constraints.maxWidth - 50,
                                        height: 2,
                                        color: candles[index >= 0 ? index : 0]
                                                    .close <=
                                                candles[index >= 0 ? index : 0]
                                                    .open
                                            ? ColorApp.dnColor
                                            : ColorApp.upColor,
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(100),
                                          color: candles[index >= 0 ? index : 0]
                                                      .close <=
                                                  candles[index >= 0
                                                          ? index
                                                          : 0]
                                                      .open
                                              ? ColorApp.dnColor
                                              : ColorApp.upColor,
                                        ),
                                        child: Center(
                                          child: Text(
                                            NumberFormat("###.00", "pt_BR")
                                                .format(candles[
                                                        index >= 0 ? index : 0]
                                                    .close),
                                            style: TextApp.nowPriceText,
                                          ),
                                        ),
                                        width: 50 - spaceBetweenHorizontal,
                                        height: 20,
                                      ),
                                    ],
                                  ),
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                          top: 0,
                                          bottom: 40,
                                          left: 0,
                                          right: 50,
                                        ),
                                        child: CandleStickWidgetCustom(
                                          candles: candles,
                                          candleWidth: candleWidth,
                                          index: index,
                                          high: high,
                                          low: low,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      TimeRowCustom(
                        indicatorX: hoverX,
                        candles: candles,
                        scrollController: scrollController,
                        candleWidth: candleWidth,
                        indicatorTime: candles[min(
                                max(
                                    (constraints.maxWidth - 50 - hoverX) ~/
                                            candleWidth +
                                        index,
                                    0),
                                candles.length - 1)]
                            .date,
                        spaceBetweenVertical: spaceBetweenVertical,
                        gridSize: gridSize,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 30,
                          bottom: 40,
                          left: 0,
                          right: 50,
                        ),
                        child: MouseRegion(
                          onEnter: onEnter,
                          onHover: onHover,
                          onExit: onExit,
                          child: GestureDetector(
                            onPanUpdate: (update) {
                              onHorizontalDragUpdate(update.localPosition.dx);
                            },
                            onPanEnd: (update) {
                              onPanEnd();
                            },
                            onPanDown: (update) {
                              onPanDown(update.localPosition.dx);
                            },
                          ),
                        ),
                      )
                    ],
                  ),
                );
              },
            );
          },
        );
      },
    );
  }
}
