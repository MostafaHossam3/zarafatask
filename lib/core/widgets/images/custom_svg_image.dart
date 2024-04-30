import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomSvgImage extends StatelessWidget {
  const CustomSvgImage(
      {super.key, required this.path, this.height, this.width, this.radius, this.fit = BoxFit.contain, this.color});

  final String path;
  final double? height;
  final double? width;
  final Color? color;
  final BorderRadius? radius;
  final BoxFit fit;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: radius ?? BorderRadius.zero,
      child: SizedBox(
        child: SvgPicture.asset(
          path,
          height: height,
          width: width,
          color: color,
          fit: fit,
        ),
      ),
    );
  }
}
