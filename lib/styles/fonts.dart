import 'package:flutter/material.dart';

class AppFonts {
  static TextStyle getAppFont({
    required FontWeight fontWeight,
    required double fontSize,
    required Color color,
    required double letterSpacing,
    double height = 1.2,
    required TextDecoration decoration,
  }) {
    return TextStyle(
      letterSpacing: letterSpacing,
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
      height: height,
    );
  }

  static final desText = getAppFont(
    fontSize: 18,
    fontWeight: FontWeight.normal,
    color: Colors.grey,
    letterSpacing: 0,
    decoration: TextDecoration.none,
  );
  static final titleText = getAppFont(
    fontSize: 18,
    fontWeight: FontWeight.w500,
    color: Colors.black,
    letterSpacing: 0.3,
    decoration: TextDecoration.none,
  );

  static final normalText = getAppFont(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: Colors.white,
    letterSpacing: 0,
    decoration: TextDecoration.none,
  );
  static final siginText = getAppFont(
    fontSize: 28,
    fontWeight: FontWeight.bold,
    color: Colors.white,
    letterSpacing: 0,
    decoration: TextDecoration.none,
  );
  static final appBarHeader = getAppFont(
    fontSize: 20,
    fontWeight: FontWeight.normal,
    color: Colors.white,
    letterSpacing: 0,
    decoration: TextDecoration.none,
  );
  static final inboxtext = getAppFont(
    fontSize: 15,
    fontWeight: FontWeight.bold,
    color: const Color(0xffB8B8C2),
    letterSpacing: 0,
    decoration: TextDecoration.none,
  );
  static final smalltitle = getAppFont(
    fontSize: 15,
    fontWeight: FontWeight.normal,
    color: Colors.white,
    letterSpacing: 0,
    decoration: TextDecoration.none,
  );
  static final addpageText = getAppFont(
    fontSize: 15,
    fontWeight: FontWeight.normal,
    color: const Color.fromARGB(255, 153, 158, 213),
    letterSpacing: 0,
    decoration: TextDecoration.none,
  );
  static final profileHeader = getAppFont(
    fontSize: 30,
    fontWeight: FontWeight.bold,
    color: Colors.white,
    letterSpacing: 0,
    decoration: TextDecoration.none,
  );
  static final profiletext = getAppFont(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: Colors.white,
    letterSpacing: 0,
    decoration: TextDecoration.none,
  );
}
