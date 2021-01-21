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
    double margin;
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
    final data = MediaQueryData.fromWindow(WidgetsBinding.instance.window);
    return Platform.isAndroid
        ? data.size.shortestSide < 600
            ? false
            : true
        : false;
  }
}
