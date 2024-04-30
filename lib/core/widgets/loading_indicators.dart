import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:loading_gifs/loading_gifs.dart';
import 'package:ztask/core/utils/app_sizes.dart';

class CustomLoadingIndicators {
  static Widget defaultLoading({double? size, Color? color}) {
    return Center(
      child: SizedBox(
        width: size ?? AppSizes.loadingIndicatorMediumSize,
        height: size ?? AppSizes.loadingIndicatorMediumSize,
        child: CircularProgressIndicator(
          strokeWidth: 4.sp,
          color: color ?? Theme.of(Get.context!).progressIndicatorTheme.color,
        ),
      ),
    );
  }

  static Widget iOSLoadingIndicator({double? size, Color? color}) {
    return Image.asset(
      cupertinoActivityIndicator,
      width: size ?? 25.sp,
      height: size ?? 25.sp,
    );
  }
}
