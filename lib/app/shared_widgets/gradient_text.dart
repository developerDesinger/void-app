import 'package:flutter/material.dart';
import 'package:voidapp/app/config/app_colors.dart';
import 'package:voidapp/app/config/app_constants.dart';

class MyGradientText extends StatelessWidget {
  final String? text;
  final List<Color> gradientColors;
  final AlignmentGeometry begin;
  final AlignmentGeometry end;
  final FontWeight? weight;
  final double? size;
  final FontStyle? fontStyle;
  final bool? underLine;
  final bool? lineThrough;
  final double? lineThikness;
  final bool isUrbanist;
  final bool isAmiri;
  final int? maxLines;
  final TextAlign? textAlign;
  final double? letterSpacing;
  final double? wordsSpacing;
  final TextOverflow? overflow;
  final TextDirection? textDirection;
  final Color? decorationColor;

  const MyGradientText({
    super.key,
    this.text,
    required this.gradientColors,
    this.begin = Alignment.centerLeft,
    this.end = Alignment.centerRight,
    this.weight,
    this.size,
    this.fontStyle,
    this.underLine = false,
    this.lineThrough = false,
    this.lineThikness,
    this.isUrbanist = false,
    this.isAmiri = false,
    this.maxLines,
    this.textAlign,
    this.letterSpacing,
    this.wordsSpacing,
    this.overflow,
    this.textDirection,
    this.decorationColor,
  });

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle =  TextStyle(
            fontFamily: kGeistFontFamily,
            fontWeight: weight,
            fontSize: size,
            fontStyle: fontStyle,
            wordSpacing: wordsSpacing,
            letterSpacing: letterSpacing,
            color: AppColors.white,
            decoration: TextDecoration.none,
          );

    return ShaderMask(
      shaderCallback: (bounds) => LinearGradient(
        colors: gradientColors,
        begin: begin,
        end: end,
      ).createShader(bounds),
      child: Text(
        text ?? '',
        textDirection: textDirection ?? TextDirection.ltr,
        maxLines: maxLines,
        softWrap: true,
        overflow: overflow,
        style: textStyle,
        textAlign: textAlign,
      ),
    );
  }
}