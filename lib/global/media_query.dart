import 'package:flutter/material.dart';

/// Ukuran layar
double screenWidth(BuildContext context) =>
    MediaQuery.of(context).size.width;

double screenHeight(BuildContext context) =>
    MediaQuery.of(context).size.height;

/// Ukuran sisi pendek & panjang
double screenShortestSide(BuildContext context) =>
    MediaQuery.of(context).size.shortestSide;

double screenLongestSide(BuildContext context) =>
    MediaQuery.of(context).size.longestSide;

/// Orientation
bool isPortrait(BuildContext context) =>
    MediaQuery.of(context).orientation == Orientation.portrait;

bool isLandscape(BuildContext context) =>
    MediaQuery.of(context).orientation == Orientation.landscape;

/// Device Type
bool isTablet(BuildContext context) =>
    MediaQuery.of(context).size.shortestSide >= 600;

bool isSmallPhone(BuildContext context) =>
    MediaQuery.of(context).size.width < 360;

/// Pixel ratio & SafeArea
double devicePixelRatio(BuildContext context) =>
    MediaQuery.of(context).devicePixelRatio;

EdgeInsets screenPadding(BuildContext context) =>
    MediaQuery.of(context).padding;

Size screenSize(BuildContext context) =>
    MediaQuery.of(context).size;

/// Scale based on Figma-style (base width: 375, base height: 812)
const double _baseWidth = 375.0;
const double _baseHeight = 812.0;

double scaleWidth(BuildContext context, double size) {
  final width = screenWidth(context);
  return size * (width / _baseWidth);
}

double scaleHeight(BuildContext context, double size) {
  final height = screenHeight(context);
  return size * (height / _baseHeight);
}

double scaleText(BuildContext context, double fontSize) {
  // scaling rata-rata berdasarkan lebar dan tinggi
  final scaleW = screenWidth(context) / _baseWidth;
  final scaleH = screenHeight(context) / _baseHeight;
  return fontSize * ((scaleW + scaleH) / 2);
}
