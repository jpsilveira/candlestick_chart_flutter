import 'dart:async';

import 'package:candlestick_chart_flutter/Controllers/buttons_controller.dart';
import 'package:candlestick_chart_flutter/Controllers/fetch_candles.dart';
import 'package:candlestick_chart_flutter/candlestick_custom/canclesticks_custom.dart';
import 'package:candlestick_chart_flutter/shared/color_app.dart';
import 'package:candlestick_chart_flutter/shared/image_app.dart';
import 'package:candlestick_chart_flutter/shared/text_app.dart';
import 'package:candlestick_chart_flutter/widgets/toggle_tab_switch_widget.dart';
import 'package:candlesticks/candlesticks.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class My446Page extends StatefulWidget {
  @override
  _My446PageState createState() => _My446PageState();
}

class _My446PageState extends State<My446Page> {
  List<Candle> candles = [];

  Timer? timer;

  int refreshTime = 10;
  DateTime stockExchangeOpen = DateTime.parse('1900-01-01 10:00');
  DateTime stockExchangeClose = DateTime.parse('1900-01-01 17:00');

  void binanceFetch() {
    fetchCandles().then(
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
      DateTime now = DateTime.now();
      String day = DateFormat('EEEE').format(now);

      if (day != 'Saturday' && day != 'Sunday') {
        int nowSum = now.hour * 100 + now.minute;
        int stockExchangeOpenSum =
            stockExchangeOpen.hour * 100 + stockExchangeOpen.minute;
        int stockExchangeCloseSum =
            stockExchangeClose.hour * 100 + stockExchangeClose.minute;

        if (nowSum >= stockExchangeOpenSum && nowSum <= stockExchangeCloseSum) {
          binanceFetch();
        }
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
    ButtonsController buttonsController = ButtonsController();
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
//
            Container(
              width: 312,
              height: 40,
              child: ToggleTabSwitchWidget(
                labels: ['Resumo', 'Gráfico', 'Boleto'],
                percentWidth: 75,
                height: 40,
                borderRadius: 100,
                marginSelected: EdgeInsets.zero,
                indexSelected: 1,
                onSelectedIndex: (index) {
                  buttonsController.selectedIndex(index);
                },
                selectedTextStyle: TextApp.bar446TextSelect,
                selectedBackgroundColors: [
                  ColorApp.bar446BoxSelected,
                ],
                unSelectedTextStyle: TextApp.bar446Text,
                unSelectedBackgroundColors: [
                  ColorApp.bar446Box,
                ],
              ),
            ),
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
            Container(
              child: AspectRatio(
                aspectRatio: 0.86,
                child: CandlesticksCustom(
                  candles: candles,
                ),
              ),
            ),
            Container(
              height: 20,
              color: ColorApp.bgColor446,
            ),
            Container(
              color: ColorApp.bgColor446,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton(
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                    ),
                    onPressed: () {},
                    child: Image.asset(
                      ImageApp.iconClock,
                      color: ColorApp.icon446Color,
                      width: 16,
                      height: 16,
                    ),
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                    ),
                    onPressed: () {},
                    child: Image.asset(
                      ImageApp.iconCandlestick,
                      color: ColorApp.icon446Color,
                      width: 16,
                      height: 16,
                    ),
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                    ),
                    onPressed: () {},
                    child: Image.asset(
                      ImageApp.iconChart,
                      color: ColorApp.icon446Color,
                      width: 16,
                      height: 16,
                    ),
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                    ),
                    onPressed: () {},
                    child: Image.asset(
                      ImageApp.iconEdit,
                      color: ColorApp.icon446Color,
                      width: 16,
                      height: 16,
                    ),
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                    ),
                    onPressed: () {},
                    child: Image.asset(
                      ImageApp.iconMoney,
                      color: ColorApp.icon446Color,
                      width: 16,
                      height: 16,
                    ),
                  ),
                ],
              ),
            ),
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
