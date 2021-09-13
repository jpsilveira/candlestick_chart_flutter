import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'color_app.dart';

// class FontAsset {
//   static const path = "src/features/assets/fonts";
//   // static const fondue = "$path/fondue.ttf";
//
// }

class TextApp {
  // static final titleHome = TextStyle(
  //   fontFamily: FontAsset.fondue,
  //   fontSize: 24,
  //   fontWeight: FontWeight.w900,
  // );

  static final priceColumnText = GoogleFonts.ubuntu(
    fontSize: 10,
    fontWeight: FontWeight.normal,
    color: ColorApp.defaultTextColor,
  );

  static final nowPriceText = GoogleFonts.ubuntu(
    fontSize: 10,
    fontWeight: FontWeight.w700,
    color: ColorApp.nowPriceTextColor,
  );

  static final dateTimeText = GoogleFonts.ubuntu(
    fontSize: 10,
    fontWeight: FontWeight.normal,
    color: ColorApp.defaultTextColor,
  );

  static final bar446Text = GoogleFonts.ubuntu(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: ColorApp.bar446Text,
  );

  static final bar446TextSelect = GoogleFonts.ubuntu(
    fontSize: 12,
    fontWeight: FontWeight.w700,
    color: ColorApp.bar446Text,
  );

  static final stockCodeText = GoogleFonts.ubuntu(
    fontSize: 16,
    fontWeight: FontWeight.w700,
    color: ColorApp.stockText,
  );

  static final stockDetailText = GoogleFonts.ubuntu(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: ColorApp.stockText,
  );

  static final stockPercentText = GoogleFonts.ubuntu(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: ColorApp.stockPercentText,
  );

  static final stock446TitleText = GoogleFonts.ubuntu(
    fontSize: 12,
    fontWeight: FontWeight.w700,
    color: ColorApp.bar446Text,
  );

  static final userLiteText = GoogleFonts.ubuntu(
    fontSize: 12,
    fontWeight: FontWeight.w700,
    color: ColorApp.iconLiteColor,
  );

  static final accountLiteText = GoogleFonts.ubuntu(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: ColorApp.iconLiteColor,
  );

  static final defaultLiteTextColor = GoogleFonts.ubuntu(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: ColorApp.defaultLiteTextColor,
  );

  static final boldLiteTextColor = GoogleFonts.ubuntu(
    fontSize: 24,
    fontWeight: FontWeight.w700,
    color: ColorApp.boldLiteTextColor,
  );

  static final percentLiteText = GoogleFonts.ubuntu(
    fontSize: 12,
    fontWeight: FontWeight.w700,
    color: ColorApp.stockPercentText,
  );

  static final brlLiteText = GoogleFonts.ubuntu(
    fontSize: 12,
    fontWeight: FontWeight.w700,
    color: ColorApp.stockText,
  );

  static final indexLiteText = GoogleFonts.ubuntu(
    fontSize: 12,
    fontWeight: FontWeight.w700,
    color: ColorApp.defaultLiteTextColor,
  );

  static final indexBarPercentText = GoogleFonts.ubuntu(
    fontSize: 16,
    fontWeight: FontWeight.w700,
    color: ColorApp.iconLiteColor,
  );

  static final indexDownLiteText = GoogleFonts.ubuntu(
    fontSize: 16,
    fontWeight: FontWeight.w700,
    color: ColorApp.dnColor,
  );

  static final secondBarPercentText = GoogleFonts.ubuntu(
    fontSize: 10,
    fontWeight: FontWeight.normal,
    color: ColorApp.iconLiteColor,
  );

  static final boxLiteTextUp = GoogleFonts.ubuntu(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: ColorApp.upColor,
  );

  static final boxLiteText = GoogleFonts.ubuntu(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: ColorApp.iconLiteColor,
  );

  static final boxLiteTextBold = GoogleFonts.ubuntu(
    fontSize: 14,
    fontWeight: FontWeight.w700,
    color: ColorApp.iconLiteColor,
  );

  static final boxLiteTextLink = GoogleFonts.ubuntu(
    fontSize: 12,
    fontWeight: FontWeight.w700,
    color: ColorApp.boxLiteTextLink,
  );
}
