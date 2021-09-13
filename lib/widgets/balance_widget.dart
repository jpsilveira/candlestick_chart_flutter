import 'package:candlestick_chart_flutter/shared/color_app.dart';
import 'package:candlestick_chart_flutter/shared/image_app.dart';
import 'package:candlestick_chart_flutter/shared/text_app.dart';
import 'package:flutter/material.dart';

class BalanceWidget extends StatefulWidget {
  const BalanceWidget({Key? key}) : super(key: key);

  @override
  _BalanceWidgetState createState() => _BalanceWidgetState();
}

class _BalanceWidgetState extends State<BalanceWidget> {
  bool eye = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Saldo Total",
          style: TextApp.defaultLiteTextColor,
        ),
        SizedBox(
          height: 5,
        ),
        TextButton(
          style: TextButton.styleFrom(
            padding: EdgeInsets.zero,
          ),
          onPressed: () {
            setState(() {
              eye = !eye;
            });
          },
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                eye ? "R\$29.031,00" : "R\$",
                style: TextApp.boldLiteTextColor,
              ),
              SizedBox(
                width: 14,
              ),
              Container(
                width: 18,
                height: 18,
                child: Image.asset(
                  eye ? ImageApp.iconEyeOn : ImageApp.iconEyeOff,
                  color: ColorApp.iconLiteColor,
                ),
              ),
            ],
          ),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "+296 BRL",
              style: TextApp.brlLiteText,
            ),
            SizedBox(width: 8),
            Image.asset(
              ImageApp.iconArrowUp,
              color: ColorApp.upColor,
              width: 12,
              height: 12,
            ),
            SizedBox(width: 5),
            Text(
              "+1,2%",
              style: TextApp.percentLiteText,
            ),
          ],
        ),
      ],
    );
  }
}
