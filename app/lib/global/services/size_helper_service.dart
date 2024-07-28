import 'package:app/services_locator.dart';
import 'package:flutter/material.dart';

class SizeHelperService {
  static const double baseWidth = 374.0;
  static const double baseHeight = 812.0;

  late double _scaleWidth;
  late double _scaleHeight;

  void init(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    _scaleWidth = screenSize.width / baseWidth;
    _scaleHeight = screenSize.height / baseHeight;
  }

  double getScaleWidth(double size) => size * _scaleWidth;

  double getScaleHeight(double size) => size * _scaleHeight;

  double getScaleText(double size) => size * _scaleWidth;

  double getScaleRadius(double radius) => radius * _scaleWidth;
}

// Extension methods to make the usage cleaner
extension SizeExtension on num {
  double get w => locator<SizeHelperService>().getScaleWidth(toDouble());
  double get h => locator<SizeHelperService>().getScaleHeight(toDouble());
  double get sp => locator<SizeHelperService>().getScaleText(toDouble());
  double get r => locator<SizeHelperService>().getScaleRadius(toDouble());
}
