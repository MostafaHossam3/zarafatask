import 'package:flutter/material.dart';

class CustomPngImage extends StatelessWidget {
  const CustomPngImage(
      {super.key,
      required this.path,
      this.height,
      this.width,
      this.radius,
      this.color,
      this.fit});

  final String path;
  final double? height;
  final double? width;
  final Color? color;
  final BoxFit? fit;

  final BorderRadiusGeometry? radius;

  /// check radius
  @override
  Widget build(BuildContext context) {
    final devicePixelRatio = MediaQuery.of(context).devicePixelRatio;
    return ClipRRect(
      borderRadius: radius ?? BorderRadius.zero,
      child: Image.asset(
        path,
        height: height,
        width: width,
        cacheHeight: height == null ? null : (height! * devicePixelRatio).round(),
        cacheWidth: width == null ? null : (width! * devicePixelRatio).round(),
        fit: fit,
        color: color,
      ),
    );
  }
}
