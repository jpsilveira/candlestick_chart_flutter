import 'package:candlestick_chart_flutter/shared/color_app.dart';
import 'package:candlestick_chart_flutter/shared/image_app.dart';
import 'package:candlestick_chart_flutter/shared/text_app.dart';
import 'package:flutter/material.dart';

class MostReadWidget extends StatelessWidget {
  const MostReadWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(
            right: 31,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "MAIS LIDAS",
                style: TextApp.indexLiteText,
              ),
              Text(
                "ver tudo",
                style: TextApp.boxLiteTextLink,
              ),
            ],
          ),
        ),
        const SizedBox(height: 18),
        Padding(
          padding: const EdgeInsets.only(
            right: 31,
          ),
          child: Container(
            height: 110,
            // width: 311,
            decoration: BoxDecoration(
              color: ColorApp.barLiteBox,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 130,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 17,
                      left: 18,
                    ),
                    child: Image.asset(
                      ImageApp.iconStockMarket,
                      // color: ColorApp.iconLiteColor,
                      width: 120,
                      height: 77,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 21,
                    left: 22,
                  ),
                  child: Container(
                    width: 155,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Bovespa Operações",
                          style: TextApp.brlLiteText,
                        ),
                        SizedBox(
                          height: 9,
                        ),
                        Container(
                          width: 155,
                          child: Text(
                              "Ibovespa fecha em baixa preliminar de 3,20% a 115.079 PTS",
                              style: TextApp.accountLiteText),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 38),
      ],
    );
  }
}
