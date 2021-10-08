library screensizes;

import 'dart:io';
import 'package:flutter/material.dart';

class ScreenSizes {
  static Size screenSize(BuildContext context) {
    return MediaQuery.of(context).size;
  }

  static double screenPixcelRatio(BuildContext context) {
    return MediaQuery.of(context).devicePixelRatio;
  }

  static double screenHeight(BuildContext context, {double dividedBy = 1}) {
    return screenSize(context).height * dividedBy;
  }

  static double screenWidth(BuildContext context, {double dividedBy = 1}) {
    return screenSize(context).width * dividedBy;
  }

  static double smartBannerSize(BuildContext context) {
    double margin = 0;
    double height = screenHeight(context);

    if (height <= 400) {
      margin = 32;
    } else if (height > 400 && height < 720) {
      margin = 50;
    } else if (height >= 720) {
      margin = 90;
    }

    return margin;
  }

  static bool isAndroidTablet() {
    final data = MediaQueryData.fromWindow(WidgetsBinding.instance!.window);
    return Platform.isAndroid
        ? data.size.shortestSide < 600
            ? false
            : true
        : false;
  }

  static double convert(
      BuildContext context, double origScreenWidth, double origSize) {
    return ((screenWidth(context) * origSize) / origScreenWidth);
  }

  static Size textSize(String text, TextStyle style) {
    final TextPainter textPainter = TextPainter(
        text: TextSpan(text: text, style: style),
        maxLines: 1,
        textDirection: TextDirection.ltr)
      ..layout(minWidth: 0, maxWidth: double.infinity);
    return textPainter.size;
  }

  static bool isSmallScreen(BuildContext context) {
    return MediaQuery.of(context).size.width < 800;
  }

  static bool isLargeScreen(BuildContext context) {
    return MediaQuery.of(context).size.width > 1200;
  }

  static bool isMediumScreen(BuildContext context) {
    return MediaQuery.of(context).size.width >= 800 &&
        MediaQuery.of(context).size.width <= 1200;
  }
}
