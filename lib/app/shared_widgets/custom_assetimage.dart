import 'package:flutter/material.dart';
import 'package:voidapp/app/utils/utils.dart';

class CustomAssetImage extends StatelessWidget {
  final String path;
  const CustomAssetImage({super.key, required this.path});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      Utils.getImagePath(path),
      scale: 4,
    );
  }
}
class CustomAssetIcon extends StatelessWidget {
  final String path;
  final double scale;
  final Color? color;
  const CustomAssetIcon({super.key, required this.path, this.scale = 4, this.color});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      Utils.getIconPath(path),
      scale: scale,
      color: color,
    );
  }
}
