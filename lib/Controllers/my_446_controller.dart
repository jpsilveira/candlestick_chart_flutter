import 'dart:convert';

import 'package:candlesticks/candlesticks.dart';
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
}
