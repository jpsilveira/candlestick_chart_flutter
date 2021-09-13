import 'dart:async';

import 'package:candlestick_chart_flutter/Controllers/my_446_controller.dart';
import 'package:candlestick_chart_flutter/shared/color_app.dart';
import 'package:candlestick_chart_flutter/shared/text_app.dart';
import 'package:candlestick_chart_flutter/widgets/bottom_bar_my_446_widget.dart';
import 'package:candlestick_chart_flutter/widgets/button_bar_widget.dart';
import 'package:candlestick_chart_flutter/widgets/candlestick_chart_widget.dart';
import 'package:candlesticks/candlesticks.dart';
import 'package:flutter/material.dart';

class My446Page extends StatefulWidget {
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

    binanceFetch();

    timer = Timer.periodic(Duration(seconds: refreshTime), (Timer t) {
      if (my446Controller.refreshStockQuote(
        stockExchangeOpen: stockExchangeOpen,
        stockExchangeClose: stockExchangeClose,
      )) {
        binanceFetch();
      }
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // ButtonsController buttonsController = ButtonsController();
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
            Container(
              // color: Colors.yellow,
              height: 88,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'VALE3',
                          style: TextApp.stockCodeText,
                        ),
                        Text(
                          '99,85',
                          style: TextApp.stockCodeText,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'VALE ON NM',
                          style: TextApp.stockDetailText,
                        ),
                        Text(
                          '2,03%',
                          style: TextApp.stockPercentText,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            CandlestickChartWidget(candles: candles),
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
