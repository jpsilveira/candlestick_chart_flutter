import 'package:candlestick_chart_flutter/shared/color_app.dart';
import 'package:candlestick_chart_flutter/shared/image_app.dart';
import 'package:candlestick_chart_flutter/shared/text_app.dart';
import 'package:flutter/material.dart';

class AcademyWidget extends StatelessWidget {
  const AcademyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        right: 31,
      ),
      child: Container(
        height: 110,
        width: 311,
        decoration: BoxDecoration(
          color: ColorApp.barLiteBoxSelected,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 73,
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 22,
                  left: 24,
                ),
                child: Image.asset(
                  ImageApp.iconAcademy,
                  color: ColorApp.iconLiteColor,
                  width: 30,
                  height: 30,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 24,
                left: 10,
              ),
              child: Container(
                width: 232,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Academy",
                      style: TextApp.indexBarPercentText,
                    ),
                    SizedBox(
                      height: 9,
                    ),
                    Container(
                      child: Text(
                          "Cursos sobre day trade, análises de mercado e muito mais",
                          style: TextApp.boxLiteText),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
