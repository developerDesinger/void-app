import 'package:flutter/material.dart';
class AppColors{
  static const Color white = Colors.white;
  static const Color black = Color(0xff020202);
  static const Color grey6B = Color(0xFF65676B);
  static const Color trans = Colors.transparent;

  static Color primary = const Color( 0xFF101010);
  static Color secondary = const Color( 0xFFA0A0A0);
  static Color tertiary = const Color( 0xFFDF2C1C);
  static Color shadowRed = const Color( 0xFFDF2C1C);
  static Color enterVoidBtn = const Color(0xFFF0F0F0);

  static  LinearGradient lightShapeGradient = LinearGradient(
    colors: [const Color(0xFFD9D9D9), const Color(0xFF737373).withOpacity(0.2)],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  static const LinearGradient buttonBorderGradient = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    stops: [0.0, 0.5, 1.0],
    colors: [
      Color.fromRGBO(203, 215, 232, 0.15),
      Color.fromRGBO(203, 215, 232, 0.4),
      Color.fromRGBO(203, 215, 232, 0.15),
    ],
  );

static const textGradient = LinearGradient(
    colors: [
      Color(0xFFFFFFFF), // #FFFFFF
      Color(0xFF878787), // #878787
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  static const List<Color> screenTimeGradient = [
    Color(0xFFECECEC),
    Color(0xFF767676),
  ];

  static const List<Color> headingGradient = [
    Color(0xFFECECEC),
    Color(0xFFC6C6C6),
  ];


  static const List<Color> blueTextGradient = [
    Color(0xFFC0E5FD),
    Color(0xFF2B5CE2),
  ];

  static const List<Color> timeTextGradient = [
    Color(0xFFFFFFFF),
    Color(0xFF878787),
  ];


}