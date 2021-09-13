import 'package:candlestick_chart_flutter/shared/color_app.dart';
import 'package:candlestick_chart_flutter/shared/text_app.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProAccountWidget extends StatefulWidget {
  final bool evolutionPro;
  final Function(bool) setEvolutionPro;

  const ProAccountWidget({
    Key? key,
    required this.evolutionPro,
    required this.setEvolutionPro,
  }) : super(key: key);

  @override
  State<ProAccountWidget> createState() => _ProAccountWidgetState();
}

class _ProAccountWidgetState extends State<ProAccountWidget> {
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
          color: ColorApp.barLiteBox,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 24,
                left: 24,
              ),
              child: Container(
                width: 232,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Trader Evolution PRO",
                      style: TextApp.indexBarPercentText,
                    ),
                    SizedBox(
                      height: 9,
                    ),
                    Container(
                      width: 218,
                      child: Text(
                          "Conheça a versão Pro e tenha acesso a mais funcionalidades",
                          style: TextApp.boxLiteText),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: 79,
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 18,
                ),
                child: CupertinoSwitch(
                  value: widget.evolutionPro,
                  onChanged: (value) {
                    widget.setEvolutionPro(value);
                  },
                  activeColor: ColorApp.bar446BoxSelected,
                  trackColor: ColorApp.switchTrackLite,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
