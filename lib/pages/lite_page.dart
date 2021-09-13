import 'package:candlestick_chart_flutter/Controllers/buttons_controller.dart';
import 'package:candlestick_chart_flutter/shared/color_app.dart';
import 'package:candlestick_chart_flutter/widgets/academy_widget.dart';
import 'package:candlestick_chart_flutter/widgets/assets_list_assets.dart';
import 'package:candlestick_chart_flutter/widgets/balance_widget.dart';
import 'package:candlestick_chart_flutter/widgets/bottom_bar_widget.dart';
import 'package:candlestick_chart_flutter/widgets/index_chart_widget.dart';
import 'package:candlestick_chart_flutter/widgets/index_widget.dart';
import 'package:candlestick_chart_flutter/widgets/most_read_widget.dart';
import 'package:candlestick_chart_flutter/widgets/pro_account_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/head_widget.dart';

class LitePage extends StatefulWidget {
  @override
  _LitePageState createState() => _LitePageState();
}

class _LitePageState extends State<LitePage> {
  bool eye = false;
  bool evolutionPro = false;

  ButtonsController buttonsController = ButtonsController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorApp.bgColorLite,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 62),
            HeadWidget(evolutionPro: evolutionPro),
            SizedBox(height: 37),
            BalanceWidget(),
            const SizedBox(height: 25),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 31,
                ),
                child: ListView(
                  children: [
                    const SizedBox(height: 20),
                    IndexWidget(),
                    SizedBox(height: 28),
                    IndexChartWidget(),
                    SizedBox(height: 84),
                    AssetsListWidget(),
                    SizedBox(height: 23),
                    AcademyWidget(),
                    SizedBox(height: 16),
                    ProAccountWidget(
                        evolutionPro: evolutionPro,
                        setEvolutionPro: (index) {
                          evolutionPro = index;
                          setState(() {});
                        }),
                    SizedBox(height: 39),
                    MostReadWidget(),
                    BottomBarWidget(),
                    SizedBox(height: 26),
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
