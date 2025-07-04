import 'package:flutter/material.dart';

class SizeHelper {
  static double adaptiveSize(
      BuildContext context, double mobile, double desktop) {
    final isMobile = MediaQuery.of(context).size.width < 700;
    final width = MediaQuery.of(context).size.width;
    return isMobile ? mobile : width * desktop;
  }

  static bool isMobile(BuildContext context) {
    return MediaQuery.of(context).size.width < 700;
  }
}
