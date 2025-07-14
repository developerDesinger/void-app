import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:voidapp/app/config/app_constants.dart';

class MyText extends StatelessWidget {
  final String? title, family;
  final FontWeight? weight;
  final double? size;
  final Color? clr;
  final Color? decorationColor;
  final bool? lineThrough;
  final bool? underLine;
  final int? line;
  final TextDecoration? textDecoration;
  final double? lineThikness;
  final TextAlign? textAlign;
  final Paint? bgColor;
  final double? letterSpacing;
  final double? wordsSpacing;
  final TextOverflow? overFLow;
  final TextDirection? textDirection;
  final FontStyle? fontStyle;
  const MyText(
      {super.key,
      this.title,
      this.textDecoration,
      this.underLine,
      this.size,
      this.clr,
      this.textDirection,
      this.overFLow,
      this.weight,
      this.family,
      this.bgColor,
      this.lineThrough = false,
      this.line,
      this.letterSpacing,
      this.wordsSpacing,
      this.textAlign,
      this.decorationColor,
      this.lineThikness,
      this.fontStyle});

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = TextStyle(
            fontFamily: kGeistFontFamily,
            fontWeight: weight,
            fontSize: size,
            fontStyle: fontStyle,
            wordSpacing: wordsSpacing,
            letterSpacing: letterSpacing,
            color: clr,
            decoration: TextDecoration.none,
          );

    return Text(title!,
        textDirection: textDirection ?? TextDirection.ltr,
        maxLines: line,
        softWrap: true,
        overflow: overFLow,
        style: textStyle,
        textAlign: textAlign);
  }
}
