import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ztask/core/global/theme/theme_color/theme_color_light.dart';
import 'package:ztask/core/utils/app_fonts.dart';
import 'package:ztask/core/utils/app_sizes.dart';

ThemeData get getThemeDataLight => ThemeData(
      colorScheme: const ColorScheme.light(
        background: ThemeColorLight.backgroundColor,
      ),
      iconTheme: const IconThemeData(color: ThemeColorLight.tertiaryColor),
      primaryColor: ThemeColorLight.primaryColor,
      dividerColor: ThemeColorLight.dividerColor,
      inputDecorationTheme: InputDecorationTheme(
          fillColor: ThemeColorLight.whiteColor,
          errorMaxLines: 2,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: ThemeColorLight.dividerColor,
              width: AppSizes.bs1_0,
            ),
            borderRadius: BorderRadius.circular(AppSizes.br12),
          ),
          hintStyle: TextStyle(fontWeight: AppFonts.regular, fontSize: AppSizes.h6, color: ThemeColorLight.hintColor),
          outlineBorder: BorderSide(
            color: ThemeColorLight.dividerColor,
            width: AppSizes.bs1_0,
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: ThemeColorLight.errorColor,
              width: AppSizes.bs1_0,
            ),
            borderRadius: BorderRadius.circular(AppSizes.br12),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: ThemeColorLight.errorColor,
              width: AppSizes.bs1_0,
            ),
            borderRadius: BorderRadius.circular(AppSizes.br12),
          ),
          floatingLabelStyle: TextStyle(color: ThemeColorLight.tertiaryColor, fontWeight: AppFonts.medium, fontSize: AppSizes.h7),
          errorStyle: TextStyle(
            color: ThemeColorLight.errorColor,
            fontSize: AppSizes.h7,
            fontWeight: AppFonts.regular,
            fontFamily: AppFonts.getAppFont,
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: ThemeColorLight.secondaryColor,
              width: AppSizes.bs1_0,
            ),
            borderRadius: BorderRadius.circular(AppSizes.br12),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: ThemeColorLight.errorColor,
              width: AppSizes.bs1_0,
            ),
            borderRadius: BorderRadius.circular(AppSizes.br12),
          ),
          labelStyle: TextStyle(
            color: ThemeColorLight.secondaryColor,
            fontSize: AppSizes.h5,
            fontWeight: AppFonts.regular,
            fontFamily: AppFonts.getAppFont,
          )),
      tabBarTheme: TabBarTheme(
        unselectedLabelColor: ThemeColorLight.tertiaryColor,
        labelStyle: TextStyle(
          color: ThemeColorLight.tertiaryColor,
          fontWeight: AppFonts.regular,
          fontSize: AppSizes.h7,
        ),
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: ThemeColorLight.backgroundColor,
        titleTextStyle: TextStyle(
          color: ThemeColorLight.tertiaryColor,
          fontFamily: AppFonts.getAppFont,
          fontWeight: AppFonts.medium,
          fontSize: AppSizes.h6,
        ),
      ),
      cupertinoOverrideTheme: const NoDefaultCupertinoThemeData(
          applyThemeToAll: true,
          primaryColor: ThemeColorLight.primaryColor,
          barBackgroundColor: ThemeColorLight.primaryColor,
          primaryContrastingColor: ThemeColorLight.primaryColor,
          scaffoldBackgroundColor: ThemeColorLight.primaryColor),
      fontFamily: AppFonts.getAppFont,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
            padding: MaterialStateProperty.all<EdgeInsetsGeometry>(const EdgeInsets.all(0)),
            backgroundColor: MaterialStateProperty.all<Color>(ThemeColorLight.primaryColor),
            elevation: MaterialStateProperty.all<double>(0),
            splashFactory: NoSplash.splashFactory,
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                AppSizes.br50,
              ),
            ))),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
        side: const BorderSide(
          color: ThemeColorLight.primaryColor,
        ),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(
          AppSizes.br50,
        ))),
      )),
      textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                  AppSizes.br50,
                ),
              )),
              overlayColor: MaterialStateProperty.all<Color>(
                ThemeColorLight.secondaryColor,
              ))),
      textTheme: getTextTheme(),
      cardTheme: const CardTheme(elevation: 15),
    );

getTextTheme() => TextTheme(
    titleLarge: TextStyle(
        color: ThemeColorLight.primaryColor, fontSize: AppSizes.h4, fontWeight: AppFonts.medium, fontFamily: AppFonts.getAppFont, height: 1.03),
    titleMedium: TextStyle(
        color: ThemeColorLight.primaryColor, fontSize: AppSizes.h5, fontWeight: AppFonts.regular, fontFamily: AppFonts.getAppFont, height: 1.03),
    titleSmall: TextStyle(
        color: ThemeColorLight.primaryColor, fontSize: AppSizes.h8, fontWeight: AppFonts.regular, fontFamily: AppFonts.getAppFont, height: 1.03),
    headlineLarge: TextStyle(
        color: ThemeColorLight.headlineTextColor, fontSize: AppSizes.h3, fontWeight: AppFonts.bold, fontFamily: AppFonts.getAppFont, height: 1.03),
    headlineMedium: TextStyle(
        color: ThemeColorLight.headlineTextColor, fontSize: AppSizes.h6, fontWeight: AppFonts.regular, fontFamily: AppFonts.getAppFont, height: 1.03),
    headlineSmall: TextStyle(
        color: ThemeColorLight.headlineTextColor, fontSize: AppSizes.h8, fontWeight: AppFonts.regular, fontFamily: AppFonts.getAppFont, height: 1.03),
    bodyLarge: TextStyle(
        color: ThemeColorLight.greyColor, fontSize: AppSizes.h5, fontWeight: AppFonts.regular, fontFamily: AppFonts.getAppFont, height: 1.03),
    bodyMedium: TextStyle(
        color: ThemeColorLight.greyColor, fontSize: AppSizes.h7, fontWeight: AppFonts.regular, fontFamily: AppFonts.getAppFont, height: 1.03),
    displayMedium: TextStyle(
        color: ThemeColorLight.whiteColor, fontSize: AppSizes.h7, fontWeight: AppFonts.regular, fontFamily: AppFonts.getAppFont, height: 1.03),
    labelSmall: TextStyle(
        color: ThemeColorLight.infoTextColor, fontSize: AppSizes.h8, fontWeight: AppFonts.regular, fontFamily: AppFonts.getAppFont, height: 1.03));
