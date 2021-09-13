import 'package:flutter/material.dart';
import 'package:flutter_toggle_tab/flutter_toggle_tab.dart';

class ToggleTabSwitchWidget extends StatefulWidget {
  final List<String> labels;
  final double percentWidth;
  final double height;
  final double borderRadius;
  final int indexSelected;
  final TextStyle selectedTextStyle;
  final TextStyle unSelectedTextStyle;
  final Function(int) onSelectedIndex;
  final List<Color>? selectedBackgroundColors;
  final List<Color>? unSelectedBackgroundColors;
  final EdgeInsets? marginSelected;

  const ToggleTabSwitchWidget({
    Key? key,
    required this.onSelectedIndex,
    required this.labels,
    required this.percentWidth,
    required this.height,
    required this.borderRadius,
    required this.selectedTextStyle,
    required this.unSelectedTextStyle,
    required this.indexSelected,
    required this.selectedBackgroundColors,
    required this.unSelectedBackgroundColors,
    required this.marginSelected,
  }) : super(key: key);

  @override
  _ToggleTabSwitchWidgetState createState() => _ToggleTabSwitchWidgetState();
}

class _ToggleTabSwitchWidgetState extends State<ToggleTabSwitchWidget> {
  late int indexSelected = -1;

  @override
  Widget build(BuildContext context) {
    return FlutterToggleTab(
        marginSelected: widget.marginSelected,
        // width in percent, to set full width just set to 100
        width: widget.percentWidth,
        borderRadius: widget.borderRadius,
        height: widget.height,
        selectedTextStyle: widget.selectedTextStyle,
        selectedBackgroundColors: widget.selectedBackgroundColors,
        unSelectedTextStyle: widget.unSelectedTextStyle,
        unSelectedBackgroundColors: widget.unSelectedBackgroundColors,
        labels: widget.labels,
        selectedIndex: widget.indexSelected,
        selectedLabelIndex: (value) {
          // setState(() {
          widget.onSelectedIndex(value);
          // });
        });
  }
}
