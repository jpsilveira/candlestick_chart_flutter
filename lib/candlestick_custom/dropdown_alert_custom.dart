import 'dart:async';

import 'package:candlestick_chart_flutter/shared/color_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dropdown_alert/model/data_alert.dart';

import 'alert_controller_custom.dart';

typedef VoidCallBack = void Function(List<Widget>);
enum AlertPosition { TOP, BOTTOM }

class DropdownAlertCustom extends StatefulWidget {
  // Callback when click on alert
  final VoidCallBack? onTap;

  // Add image for success status, get from assets
  final String? successImage;

  // Add image for warning status, get from assets
  final String? warningImage;

  // Add image for error status, get from assets
  final String? errorImage;

  // Change color background of error status
  final Color? errorBackground;

  // Change color background of success status
  final Color? successBackground;

  // Change color background of warning status
  final Color? warningBackground;

  // Change style of title
  final TextStyle? titleStyle;

  // Change style of content
  final TextStyle? contentStyle;

  // Set max line of title, default null
  final int? maxLinesTitle;

  // Set max line of content, default null
  final int? maxLinesContent;

  final int? duration;

  final int? delayDismiss;

  // Set position of alert, default AlertPosition.TOP
  final AlertPosition? position;

  const DropdownAlertCustom(
      {Key? key,
      this.onTap,
      this.successImage,
      this.warningImage,
      this.errorImage,
      this.errorBackground,
      this.successBackground,
      this.warningBackground,
      this.titleStyle,
      this.contentStyle,
      this.maxLinesTitle,
      this.maxLinesContent,
      this.duration,
      this.delayDismiss,
      this.position = AlertPosition.TOP})
      : super(key: key);

  @override
  DropdownAlertCustomWidget createState() => DropdownAlertCustomWidget();
}

class DropdownAlertCustomWidget extends State<DropdownAlertCustom>
    with TickerProviderStateMixin {
  final duration = 300;
  final delay = 3000;
  late AnimationController? _animationController;
  Animation? _animationPush;
  Timer? _timer;
  Timer? _timerRelay;
  AlertControllerCustom? _controller;
  String? title;
  String? message;
  TypeAlert? type;
  List<Widget> payload = [];

  int getDuration() {
    if (widget.duration != null && widget.duration! > 0) {
      return widget.duration!;
    }
    return duration;
  }

  // Get daylay second when dismiss, if null it will be freeze
  dynamic getDelay() {
    if (widget.delayDismiss != null && widget.delayDismiss! > 0) {
      return widget.delayDismiss;
    } else if (widget.delayDismiss == null) {
      return delay;
    } else if (widget.delayDismiss! <= 0) {
      return null;
    }
    return null;
  }

  @override
  void initState() {
    super.initState();
    _controller = AlertControllerCustom();
    _controller?.setShow(show);
    _controller?.setHide(hide);
    _animationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: getDuration()));
    _animationPush =
        Tween(begin: -180.0, end: 0.0).animate(_animationController!);
  }

  show(List<Widget> payload) {
    final delay = getDelay();
    if (!_animationController!.isDismissed) {
      cancelTimerRelay();
      cancelTimer();
      _animationController!.reverse();
      _timerRelay = Timer(Duration(milliseconds: getDuration()), () {
        setState(() {
          this.payload = payload;
        });
        _animationController!.forward();
        if (delay != null) {
          _timer = Timer(Duration(milliseconds: delay), () {
            _animationController!.reverse();
          });
        }
      });
    } else {
      setState(() {
        this.payload = payload;
      });
      _animationController!.forward();
      if (delay != null) {
        _timer = Timer(Duration(milliseconds: delay), () {
          _animationController!.reverse();
        });
      }
    }
  }

  hide() {
    cancelTimer();
    _animationController!.reverse();
  }

  cancelTimer() {
    if (_timer != null) {
      _timer!.cancel();
    }
  }

  cancelTimerRelay() {
    if (_timerRelay != null) {
      _timerRelay!.cancel();
    }
  }

  onPress() {
    cancelTimer();
    hide();
    if (widget.onTap != null) {
      widget.onTap!(this.payload);
    }
    if (_controller?.getTabListener() != null) {
      _controller?.getTabListener()(this.payload);
    }
  }

  String? getIconUri(TypeAlert? type) {
    switch (type) {
      case TypeAlert.success:
        return widget.successImage ?? null;
      case TypeAlert.warning:
        return widget.warningImage ?? null;
      case TypeAlert.error:
        return widget.errorImage ?? null;
      default:
        return null;
    }
  }

  // Use it when Image was null
  IconData? getIcon(TypeAlert? type) {
    switch (type) {
      case TypeAlert.success:
        return Icons.check;
      case TypeAlert.warning:
        return Icons.warning_amber_outlined;
      case TypeAlert.error:
        return Icons.error_outline;
      default:
        return null;
    }
  }

  Color getBackground(TypeAlert? type) {
    switch (type) {
      case TypeAlert.success:
        return widget.successBackground ?? Colors.green;
      case TypeAlert.warning:
        return widget.warningBackground ?? Color(0xFFCE863D);
      case TypeAlert.error:
        return widget.errorBackground ?? Colors.red;
      default:
        return Colors.green;
    }
  }

  @override
  void dispose() {
    super.dispose();
    _controller?.dispose();
    _controller = null;
    if (_timer != null) {
      _timer!.cancel();
    }
    if (_timerRelay != null) {
      _timerRelay!.cancel();
    }
  }

  @override
  Widget build(BuildContext context) {
    final titleStyle = TextStyle(
            color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)
        .merge(widget.titleStyle);
    final contentStyle =
        TextStyle(color: Colors.white).merge(widget.contentStyle);
    String? iconUri = getIconUri(this.type);
    return AnimatedBuilder(
      animation: _animationController!,
      builder: (c, v) => Positioned(
        top:
            widget.position == AlertPosition.TOP ? _animationPush!.value : null,
        bottom: widget.position == AlertPosition.BOTTOM
            ? _animationPush!.value
            : null,
        child: GestureDetector(
          onVerticalDragStart: (data) => hide(),
          child: SizedBox(
            // height: widget.position == AlertPosition.TOP ? 36 : 18,
            width: MediaQuery.of(context).size.width,
            child: MaterialButton(
              padding: EdgeInsets.only(top: 5, bottom: 5, left: 5, right: 5),
              color: widget.successBackground, // getBackground(this.type),
              // padding: EdgeInsets.all(5),
              shape: new RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                  side: BorderSide(color: ColorApp.bar446BoxSelected)),
              child: Align(
                alignment: Alignment.topLeft,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: payload),
              ),
              onPressed: onPress,
            ),
          ),
        ),
      ),
    );
  }
}
