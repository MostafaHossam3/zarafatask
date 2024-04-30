import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ztask/core/utils/utils.dart';

class AppSizes {
  /// Full Screen Size
  static double heightFullScreen = Get.height;
  static double widthFullScreen = Get.width;

  /// Font Size
  static double get h1 => isTablet() ? 36.sp : 40.0.sp;
  static double get h2 => isTablet() ? 30.sp : 28.0.sp;
  static double get h3 => isTablet() ? 20.sp : 24.0.sp;
  static double get h4 => isTablet() ? 14.sp : 18.0.sp;
  static double get h5 => isTablet() ? 10.sp : 16.0.sp;
  static double get h6 => isTablet() ? 10.sp : 14.0.sp;
  static double get h7 => isTablet() ? 8.sp : 12.0.sp;
  static double get h8 => isTablet() ? 6.sp : 10.sp;
  static double get h9 => isTablet() ? 4.sp : 8.sp;

  /// Padding Size Height
  static final double pH1 = 6.0.h;
  static final double pH2 = 8.0.h;
  static final double pH3 = 12.0.h;
  static final double pH4 = 14.0.h;
  static final double pH5 = 16.0.h;
  static final double pH6 = 18.0.h;
  static final double pH7 = 24.0.h;
  static final double pH8 = 32.0.h;
  static final double pH9 = 40.0.h;
  static final double pH10 = 52.0.h;

  /// Padding Size Width
  static final double pW1 = 6.0.w;
  static final double pW2 = 8.0.w;
  static final double pW3 = 12.0.w;
  static final double pW4 = 14.0.w;
  static final double pW5 = 16.0.w;
  static final double pW6 = 18.0.w;
  static final double pW7 = 32.0.w;
  static final double pW8 = 40.0.w;
  static final double pW9 = 75.0.w;

  /// Elevation Sizes
  static const double e1 = 2;
  static const double e2 = 4;
  static const double e3 = 6;

  /// Border Sizes
  static final double bs1_5 = 1.5.w;
  static final double bs1_0 = 1.0.w;
  static final double bs0_5 = 0.5.w;
  static final double bs0_2 = 0.2.w;

  /// Border Radius
  static double get br4 => 4.r;
  static double get br8 => 8.r;
  static double get br20 => 20.r;
  static double get br40 => 40.r;
  static double get br25 => 25.r;
  static double get br30 => 30.r;
  static double get br50 => 50.r;
  static double get brMax => 500.r;
  static double get br6 => 6.r;
  static double get br12 => 12.r;
  static double get br13 => 11.r;
  static double get br16 => 16.r;

  /// Loading Indicator Size
  static final double loadingIndicatorLargeSize = 50.sp;
  static final double loadingIndicatorMediumSize = 40.sp;

  /// Heights
  static final double splashIconSize = 240.sp;

  /// Widths

  ///icon size
  static final double icon15 = 15.sp;
  static final double icon18 = 18.sp;
  static final double icon20 = 20.sp;
  static final double icon25 = 25.sp;
  static final double icon35 = 35.sp;
  static final double icon45 = 45.sp;
  static final double icon60 = 60.sp;
  static final double icon80 = 80.sp;
}
