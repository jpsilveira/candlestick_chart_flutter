import 'dart:convert';

import 'package:candlestick_chart_flutter/candlestick_custom/alert_controller_custom.dart';
import 'package:candlestick_chart_flutter/shared/text_app.dart';
import 'package:candlesticks/candlesticks.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class My446Controller {
  bool refreshStockQuote(
      {required DateTime stockExchangeOpen,
      required DateTime stockExchangeClose}) {
    DateTime now = DateTime.now();
    String day = DateFormat('EEEE').format(now);

    bool myReturn = false;

    if (day != 'Saturday' && day != 'Sunday') {
      int nowSum = now.hour * 100 + now.minute;

      int stockExchangeOpenSum =
          stockExchangeOpen.hour * 100 + stockExchangeOpen.minute;

      int stockExchangeCloseSum =
          stockExchangeClose.hour * 100 + stockExchangeClose.minute;

      myReturn =
          nowSum >= stockExchangeOpenSum && nowSum <= stockExchangeCloseSum;
    }
    return myReturn;
  }

  Future<List<Candle>> fetchCandles() async {
    final uri = Uri.parse('http://18.207.177.93/');
    final res = await http.get(uri);

    final preList = jsonDecode(res.body) as List<dynamic>;
    List<dynamic> list = [[]];

    preList.forEach((e) {
      dynamic item = [
        (DateTime.parse(e['datetime']).millisecondsSinceEpoch),
        e['open'],
        e['high'],
        e['low'],
        e['close'],
        e['volume'],
      ];
      item = [
        item[0].toInt(),
        item[1].toString(),
        item[2].toString(),
        item[3].toString(),
        item[4].toString(),
        item[5].toString()
      ];

      if (list[0].length == 0) {
        list[0] = item;
      } else {
        list.add(item);
      }
    });

    return (list).map((e) => Candle.fromJson(e)).toList().reversed.toList();
  }

  void success({required List<Candle> candles, int? valueX}) {
    int index = 0;
    if (valueX != null && valueX != -10) {
      index = valueX;
    }
    List<Widget> payload = [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "VALE3",
            style: TextApp.boxLiteTextBold,
          ),
          Text(
            "VALE ON NM",
            style: TextApp.boxLiteTextBold,
          ),
        ],
      ),
      SizedBox(height: 4),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Data: ${DateFormat("dd/MM/yyyy HH:mm").format(candles[index].date)}",
            style: TextApp.brlLiteText,
          ),
          Text(
            "Volume: ${NumberFormat("###.00", "pt_BR").format((candles[index].volume))}",
            style: TextApp.brlLiteText,
          ),
        ],
      ),
      SizedBox(height: 2),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Alta: ${NumberFormat("###.00", "pt_BR").format((candles[index].high))}",
            style: TextApp.brlLiteText,
          ),
          Text(
            "Abertura: ${NumberFormat("###.00", "pt_BR").format((candles[index].open))}",
            style: TextApp.brlLiteText,
          ),
        ],
      ),
      SizedBox(height: 2),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Baixa: ${NumberFormat("###.00", "pt_BR").format((candles[index].low))}",
            style: TextApp.brlLiteText,
          ),
          Text(
            "Fechamento: ${NumberFormat("###.00", "pt_BR").format((candles[index].close))}",
            style: TextApp.brlLiteText,
          ),
        ],
      ),
    ];
    AlertControllerCustom.show(payload);
  }
}
