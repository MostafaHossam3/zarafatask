import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:ztask/core/utils/app_sizes.dart';

class CustomNetworkImage extends StatelessWidget {
  const CustomNetworkImage({
    super.key,
    required this.imageUrl,
    this.errorImageUrl,
    this.height,
    this.width,
    this.fit,
    this.radius,
    this.placeholder,
  });

  CustomNetworkImage.circle(
      {Key? key,
      required String imageUrl,
      String? errorImageUrl,
      required double size,
      BoxFit? fit})
      : this(
            key: key,
            radius: BorderRadius.circular(AppSizes.brMax),
            imageUrl: imageUrl,
            errorImageUrl: errorImageUrl,
            height: size,
            width: size,
            fit: fit);

  CustomNetworkImage.square(
      {Key? key,
      required String imageUrl,
      String? errorImageUrl,
      required double size,
      BorderRadius? radius})
      : this(
          key: key,
          radius: radius ?? BorderRadius.circular(AppSizes.br8),
          imageUrl: imageUrl,
          errorImageUrl: errorImageUrl,
          height: size,
          width: size,
        );

  CustomNetworkImage.rectangle(
      {Key? key,
      required String imageUrl,
      String? errorImageUrl,
      required double height,
      required double width,
      BoxFit? fit,
      BorderRadius? radius})
      : this(
            key: key,
            radius: radius ?? BorderRadius.circular(AppSizes.br8),
            imageUrl: imageUrl,
            errorImageUrl: errorImageUrl,
            height: height,
            width: width,
            fit: fit);

  final String imageUrl;
  final String? errorImageUrl;
  final double? height;
  final double? width;
  final BoxFit? fit;
  final BorderRadius? radius;
  final Widget Function(BuildContext, String)? placeholder;

  @override
  Widget build(BuildContext context) {
    final devicePixelRatio = MediaQuery.of(context).devicePixelRatio;
    return ClipRRect(
      borderRadius: radius ?? BorderRadius.circular(AppSizes.br8),
      child: CachedNetworkImage(
        height: height,
        width: width ?? AppSizes.widthFullScreen,
        fit: fit ?? BoxFit.cover,
        imageUrl: imageUrl,
        placeholder: placeholder,
        memCacheHeight: height == null ? null : (height! * devicePixelRatio).round(),
        memCacheWidth: width == null ? null : (width! * devicePixelRatio).round(),
      ),
    );
  }
}
