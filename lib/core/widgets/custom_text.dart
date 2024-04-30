import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

class CustomText extends StatelessWidget {
  const CustomText(
    this.text, {
    super.key,
    required this.textStyle,
    this.defaultTextStyle,
    this.textAlign,
    this.textDirection,
    this.overflow,
    this.maxLines,
  });

  CustomText.primaryTitleLarge(
    String text, {
    Key? key,
    TextAlign? textAlign,
    String? fontFamily,
    int? maxLines,
    TextStyle? textStyle,
    TextOverflow? overflow,
  }) : this(
          text,
          key: key,
          maxLines: maxLines,
          textAlign: textAlign,
          overflow: overflow,
          textStyle: textStyle ?? Get.theme.textTheme.titleLarge,
        );

  CustomText.primaryTitleMedium(
    String text, {
    Key? key,
    TextAlign? textAlign,
    String? fontFamily,
    int? maxLines,
    TextStyle? textStyle,
    TextOverflow? overflow,
    TextDirection? textDirection,
  }) : this(
          text,
          key: key,
          maxLines: maxLines,
          textAlign: textAlign,
          overflow: overflow,
          textDirection: textDirection,
          textStyle: textStyle ?? Get.theme.textTheme.titleMedium,
        );

  CustomText.primaryTitleSmall(
    String text, {
    Key? key,
    TextAlign? textAlign,
    String? fontFamily,
    int? maxLines,
    TextStyle? textStyle,
    TextOverflow? overflow,
    TextDirection? textDirection,
  }) : this(
          text,
          key: key,
          maxLines: maxLines,
          textAlign: textAlign,
          overflow: overflow,
          textDirection: textDirection,
          textStyle: textStyle ?? Get.theme.textTheme.titleSmall,
        );

  CustomText.headlineLarge(
    String text, {
    Key? key,
    TextAlign? textAlign,
    String? fontFamily,
    int? maxLines,
    TextStyle? textStyle,
    TextOverflow? overflow,
  }) : this(
          text,
          key: key,
          maxLines: maxLines,
          textAlign: textAlign,
          overflow: overflow,
          textStyle: textStyle ?? Get.theme.textTheme.headlineLarge,
        );

  CustomText.headlineMedium(
    String text, {
    Key? key,
    TextAlign? textAlign,
    String? fontFamily,
    int? maxLines,
    TextStyle? textStyle,
    TextOverflow? overflow,
  }) : this(
          text,
          key: key,
          maxLines: maxLines,
          textAlign: textAlign,
          overflow: overflow,
          textStyle: textStyle ?? Get.theme.textTheme.headlineMedium,
        );

  CustomText.headlineSmall(
    String text, {
    Key? key,
    TextAlign? textAlign,
    String? fontFamily,
    int? maxLines,
    TextStyle? textStyle,
    TextOverflow? overflow,
  }) : this(
          text,
          key: key,
          maxLines: maxLines,
          textAlign: textAlign,
          overflow: overflow,
          textStyle: textStyle ?? Get.theme.textTheme.headlineSmall,
        );

  CustomText.bodyLarge(
    String text, {
    Key? key,
    TextAlign? textAlign,
    String? fontFamily,
    int? maxLines,
    TextStyle? textStyle,
    TextOverflow? overflow,
  }) : this(
          text,
          key: key,
          maxLines: maxLines,
          textAlign: textAlign,
          overflow: overflow,
          textStyle: textStyle ?? Get.theme.textTheme.bodyLarge,
        );

  CustomText.bodyMedium(
    String text, {
    Key? key,
    TextAlign? textAlign,
    String? fontFamily,
    int? maxLines,
    TextStyle? textStyle,
    TextOverflow? overflow,
  }) : this(
          text,
          key: key,
          maxLines: maxLines,
          textAlign: textAlign,
          overflow: overflow,
          textStyle: textStyle ?? Get.theme.textTheme.bodyMedium,
        );

  CustomText.displayMedium(
    String text, {
    Key? key,
    TextAlign? textAlign,
    String? fontFamily,
    int? maxLines,
    TextStyle? textStyle,
    TextOverflow? overflow,
  }) : this(
          text,
          key: key,
          maxLines: maxLines,
          textAlign: textAlign,
          overflow: overflow,
          textStyle: textStyle ?? Get.theme.textTheme.displayMedium,
        );

  CustomText.labelSmall(
    String text, {
    Key? key,
    TextAlign? textAlign,
    String? fontFamily,
    int? maxLines,
    TextStyle? textStyle,
    TextOverflow? overflow,
  }) : this(
          text,
          key: key,
          maxLines: maxLines,
          textAlign: textAlign,
          overflow: overflow,
          textStyle: textStyle ?? Get.theme.textTheme.labelSmall,
        );

  /////////////////////////////////////////////////////////////////////////////////////////////////////////

  final String text;
  final TextStyle? textStyle;
  final int? defaultTextStyle;
  final TextAlign? textAlign;
  final TextDirection? textDirection;
  final TextOverflow? overflow;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: textStyle ?? getDefaultTextStyle(context, defaultTextStyle!),
      textAlign: textAlign ?? TextAlign.center,
      textDirection: textDirection,
      overflow: overflow,
      maxLines: maxLines,
    );
  }

  getDefaultTextStyle(BuildContext context, int defaultTextStyle) {
    switch (defaultTextStyle) {
      case 0:
        {
          return Theme.of(context).textTheme.titleLarge;
        }
      case 1:
        {
          return Theme.of(context).textTheme.titleMedium;
        }
      case 2:
        {
          return Theme.of(context).textTheme.headlineLarge;
        }
      case 3:
        {
          return Theme.of(context).textTheme.headlineSmall;
        }
      case 4:
        {
          return Theme.of(context).textTheme.titleSmall;
        }
      case 5:
        {
          return Theme.of(context).textTheme.labelSmall;
        }
    }
  }
}
