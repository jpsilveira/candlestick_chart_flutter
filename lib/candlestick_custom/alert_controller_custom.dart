import 'package:flutter/cupertino.dart';

typedef VoidCallBack = void Function();
typedef VoidCallBackListenerTab = void Function(List<Widget>);
typedef VoidCallBackWithValue = void Function(List<Widget>);

class AlertControllerCustom {
  // Show callback, can call anywhere
  VoidCallBackWithValue? _show;

  // Hide callback, can call anywhere
  VoidCallBack? _hide;

  // Listener callback when tab on the alert
  VoidCallBackListenerTab? _tabListener;

  static AlertControllerCustom? instance = AlertControllerCustom._init();

  factory AlertControllerCustom() => instance!;

  AlertControllerCustom._init() {
    // print("AlertControllerCustom was created!");
  }

  static onTabListener(VoidCallBackListenerTab tabListener) {
    instance?._tabListener = tabListener;
  }

  VoidCallBackListenerTab getTabListener() {
    return _tabListener!;
  }

  static show(List<Widget> payload) {
    instance?._show!(payload);
  }

  static hide() {
    instance?._hide!();
  }

  setShow(VoidCallBackWithValue show) {
    this._show = show;
  }

  setHide(VoidCallBack hide) {
    this._hide = hide;
  }

  // Dispose the alert controller when app dispose
  dispose() {
    this._show = null;
    this._hide = null;
    this._tabListener = null;
  }
}
