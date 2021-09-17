import 'dart:async';

import 'package:candlestick_chart_flutter/Controllers/my_446_controller.dart';
import 'package:candlestick_chart_flutter/candlestick_custom/alert_controller_custom.dart';
import 'package:candlestick_chart_flutter/candlestick_custom/dropdown_alert_custom.dart';
import 'package:candlestick_chart_flutter/shared/color_app.dart';
import 'package:candlestick_chart_flutter/shared/text_app.dart';
import 'package:candlestick_chart_flutter/widgets/bottom_bar_my_446_widget.dart';
import 'package:candlestick_chart_flutter/widgets/button_bar_widget.dart';
import 'package:candlestick_chart_flutter/widgets/candlestick_chart_widget.dart';
import 'package:candlestick_chart_flutter/widgets/stock_my446_widget.dart';
import 'package:candlesticks/candlesticks.dart';
import 'package:flutter/material.dart';

class My446Page extends StatefulWidget {
  const My446Page({Key? key}) : super(key: key);
  @override
  _My446PageState createState() => _My446PageState();
}

class _My446PageState extends State<My446Page> {
  My446Controller my446Controller = My446Controller();

  List<Candle> candles = [];

  Timer? timer;

  int refreshTime = 60; // seconds
  DateTime stockExchangeOpen = DateTime.parse('1900-01-01 10:00');
  DateTime stockExchangeClose = DateTime.parse('1900-01-01 18:00');
  int lastIndex = 0;

  void binanceFetch() {
    my446Controller.fetchCandles().then(
          (value) => setState(
            () {
              candles = value;
              // print("refresh - ${DateTime.now()}");
            },
          ),
        );
  }

  @override
  void initState() {
    super.initState();
    AlertControllerCustom?.onTabListener((List<Widget>? payload) {
      AlertControllerCustom?.hide();
    });

    binanceFetch();

    timer = Timer.periodic(Duration(seconds: refreshTime), (Timer t) {
      binanceFetch();
      // if (my446Controller.refreshStockQuote(
      //   stockExchangeOpen: stockExchangeOpen,
      //   stockExchangeClose: stockExchangeClose,
      // )) {
      //   binanceFetch();
      // }
    });
  }

  @override
  void dispose() {
    timer?.cancel();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          "VALE3",
          style: TextApp.stock446TitleText,
        ),
        centerTitle: true,
        leading: BackButton(
          onPressed: () {
            Navigator.pushReplacementNamed(context, "/lite");
          },
          color: ColorApp.icon446Color,
        ),
      ),
      backgroundColor: ColorApp.bgColor446,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ButtonBarWidget(),
            Stack(
              children: [
                TextButton(
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.zero,
                  ),
                  onPressed: () {
                    my446Controller.success(
                        candles: candles, valueX: lastIndex);
                  },
                  child: StockMy446_widget(
                      height: 88,
                      stockAcronym: 'VALE3',
                      stockName: 'VALE ON NM',
                      stockValue: '99,85',
                      stockPercent: '2,03%'),
                ),
                DropdownAlertCustom(
                  delayDismiss: 0,
                  successBackground: ColorApp.barLiteBox,
                ),
              ],
            ),
            CandlestickChartWidget(
              candles: candles,
              callLastIndex: (value) {
                AlertControllerCustom.hide();
                lastIndex = value;
              },
            ),
            Container(
              height: 20,
              color: ColorApp.bgColor446,
            ),
            BottomBarMy446Widget(),
            Expanded(
              child: Container(
                color: ColorApp.bgColor446,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
