import 'package:candlestick_chart_flutter/Controllers/buttons_controller.dart';
import 'package:candlestick_chart_flutter/shared/color_app.dart';
import 'package:candlestick_chart_flutter/shared/image_app.dart';
import 'package:candlestick_chart_flutter/shared/text_app.dart';
import 'package:candlestick_chart_flutter/widgets/toggle_tab_switch_widget.dart';
import 'package:flutter/material.dart';

class IndexChartWidget extends StatelessWidget {
  const IndexChartWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ButtonsController buttonsController = ButtonsController();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "IBOV",
                      style: TextApp.indexBarPercentText,
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Text(
                          "Ibovespa ",
                          style: TextApp.indexBarPercentText,
                        ),
                        Text(
                          "-1,23% ",
                          style: TextApp.indexDownLiteText,
                        ),
                        Image.asset(
                          ImageApp.iconArrowDown,
                          color: ColorApp.dnColor,
                          width: 13,
                          height: 13,
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 45),
                Expanded(
                  child: Center(
                    child: Text(
                      "129.425,83",
                      style: TextApp.boldLiteTextColor,
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
        SizedBox(height: 19),
        Container(
          padding: EdgeInsets.only(
            right: 31,
          ),
          // width: 284,
          height: 40,
          child: Row(
            children: [
              ToggleTabSwitchWidget(
                labels: ['D', 'S', 'M', 'A', '12M'],
                percentWidth: 75,
                height: 40,
                borderRadius: 100,
                marginSelected: EdgeInsets.zero,
                indexSelected: 0,
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
              Container(
                width: 40,
                child: TextButton(
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                    ),
                    onPressed: () {},
                    child: Icon(
                      Icons.add,
                      size: 28,
                      color: ColorApp.iconLiteColor,
                    )),
              ),
            ],
          ),
        ),
        SizedBox(height: 25),
        Padding(
          padding: const EdgeInsets.only(
            right: 31,
          ),
          child: Container(
            height: 216,
            child: Image.asset(
              ImageApp.iconLineChart,
            ),
          ),
        ),
      ],
    );
  }
}
