import 'package:flutter/material.dart';

abstract class AppTextStyles {
  static const h1 = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 32,
    height: 1.3125,
  );

  static const h1Bold = TextStyle(
    fontWeight: FontWeight.w700,
    fontSize: 32,
    height: 1.4375,
  );

  static const h2 = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 24,
    height: 1.5,
  );
  static const h3 = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 14,
    height: 1.5,
  );
}
