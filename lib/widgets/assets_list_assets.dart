import 'package:candlestick_chart_flutter/Controllers/buttons_controller.dart';
import 'package:candlestick_chart_flutter/shared/color_app.dart';
import 'package:candlestick_chart_flutter/shared/text_app.dart';
import 'package:candlestick_chart_flutter/widgets/stock_widget.dart';
import 'package:candlestick_chart_flutter/widgets/toggle_tab_switch_widget.dart';
import 'package:flutter/material.dart';

class AssetsListWidget extends StatelessWidget {
  const AssetsListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ButtonsController buttonsController = ButtonsController();

    return Column(
      children: [
        Text(
          "LISTA DE ATIVOS",
          style: TextApp.indexLiteText,
        ),
        SizedBox(height: 20),
        Container(
          padding: EdgeInsets.only(
            right: 31,
          ),
          width: 314,
          height: 40,
          child: ToggleTabSwitchWidget(
            labels: ['Altas', 'Quedas', 'Volume', 'Watchlist'],
            percentWidth: 82,
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
        ),
        SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.only(
            right: 31,
          ),
          child: Column(
            children: [
              StockWidget(
                height: 40,
                stockAcronym: 'PETR4',
                stockName: 'Petrobras PN N2',
                stockValue: '21,32',
                stockPercent: '2,03',
                chartPos: 0,
                hasDivider: true,
                go446: false,
              ),
              StockWidget(
                height: 40,
                stockAcronym: 'VALE3',
                stockName: 'Vale ON NM',
                stockValue: '99,85',
                stockPercent: '2,03',
                chartPos: 1,
                hasDivider: true,
                go446: true,
              ),
              StockWidget(
                height: 40,
                stockAcronym: 'BBAS3',
                stockName: 'Brasil ON MN',
                stockValue: '32,78',
                stockPercent: '1,05',
                chartPos: 2,
                hasDivider: true,
                go446: false,
              ),
              StockWidget(
                height: 40,
                stockAcronym: 'BBDC4',
                stockName: 'Bradesco PN n1',
                stockValue: '26,20',
                stockPercent: '1,83',
                chartPos: 0,
                hasDivider: true,
                go446: false,
              ),
              StockWidget(
                height: 40,
                stockAcronym: 'ITUB4',
                stockName: 'Vale ON MN',
                stockValue: '99,85',
                stockPercent: '0,40',
                chartPos: 1,
                hasDivider: true,
                go446: false,
              ),
              StockWidget(
                height: 40,
                stockAcronym: 'BBAS3',
                stockName: 'Brasil ON MN',
                stockValue: '32,78',
                stockPercent: '1,05',
                chartPos: 2,
                hasDivider: true,
                go446: false,
              ),
              StockWidget(
                height: 40,
                stockAcronym: 'BBDC4',
                stockName: 'Bradesco PN n1',
                stockValue: '26,20',
                stockPercent: '1,83',
                chartPos: 0,
                hasDivider: false,
                go446: false,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
