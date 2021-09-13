import 'package:candlestick_chart_flutter/Controllers/buttons_controller.dart';
import 'package:candlestick_chart_flutter/shared/color_app.dart';
import 'package:candlestick_chart_flutter/shared/text_app.dart';
import 'package:flutter/material.dart';

import 'toggle_tab_switch_widget.dart';

class ButtonBarWidget extends StatelessWidget {
  const ButtonBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ButtonsController buttonsController = ButtonsController();

    return Container(
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
    );
  }
}
