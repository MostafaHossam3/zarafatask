import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:ztask/core/global/theme/theme_color/theme_color_light.dart';
import 'package:ztask/core/services/navigation_services.dart';
import 'package:ztask/core/services/status_bar_manager.dart';
import 'package:ztask/core/utils/app_assets.dart';
import 'package:ztask/core/utils/app_fonts.dart';
import 'package:ztask/core/utils/app_sizes.dart';
import 'package:ztask/core/utils/utils.dart';
import 'package:ztask/core/widgets/custom_text.dart';
import 'package:ztask/core/widgets/images/custom_network_image.dart';
import 'package:ztask/core/widgets/images/custom_png_image.dart';
import 'package:ztask/core/widgets/images/custom_svg_image.dart';
import 'package:ztask/core/widgets/loading_indicators.dart';
import 'package:ztask/features/merchant/presentation/controllers/merchant_details_provider.dart';

class MerchantDetailsScreen extends StatelessWidget {
  const MerchantDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    StatusBarManager.setTransparentWithNormalIconColor(context: context);
    return Scaffold(
        body: ChangeNotifierProvider<MerchantDetailsProvider>(
            create: (context) => MerchantDetailsProvider(),
            child: Consumer<MerchantDetailsProvider>(
              builder: (context, provider, child) => provider.isLoading
                  ? Center(child: CustomLoadingIndicators.iOSLoadingIndicator())
                  : SingleChildScrollView(
                      child: Stack(
                        fit: StackFit.loose,
                        children: [
                          CustomNetworkImage(
                            imageUrl: provider.merchantEntity!.brandImage!,
                            fit: BoxFit.cover,
                            height: AppSizes.heightFullScreen / 2.76,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: AppSizes.pW6),
                            child: Column(
                              children: [
                                SizedBox(height: AppSizes.heightFullScreen / 2.76 - 47.5.w),
                                Container(
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border.all(color: ThemeColorLight.lightGreyColor, width: 1.5),
                                      borderRadius: BorderRadius.circular(AppSizes.br20)),
                                  child: CustomNetworkImage(
                                    imageUrl: provider.merchantEntity!.logo,
                                    fit: BoxFit.cover,
                                    height: 95.w,
                                    width: 95.w,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              NavigationService.goBack();
                            },
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: AppSizes.pW6, vertical: AppSizes.pH10),
                              child: const CustomSvgImage(path: AppAssets.backSvg),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: AppSizes.pW6),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(height: AppSizes.heightFullScreen / 2.76 + AppSizes.pH7),
                                Align(
                                  alignment: AlignmentDirectional.centerEnd,
                                  child: Column(
                                    children: [
                                      Container(
                                        padding: EdgeInsets.symmetric(vertical: AppSizes.pH4, horizontal: AppSizes.pW4),
                                        decoration: BoxDecoration(
                                            border: Border.all(color: ThemeColorLight.secondaryColor, width: .7),
                                            borderRadius: BorderRadius.circular(AppSizes.br13)),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            CustomPngImage(
                                              path: AppAssets.starPng,
                                              width: AppSizes.pW3,
                                            ),
                                            Gap(AppSizes.pW1),
                                            CustomText.primaryTitleMedium(
                                              '4.1',
                                              textStyle:
                                                  TextStyle(color: ThemeColorLight.secondaryColor, fontSize: AppSizes.h7, fontWeight: AppFonts.bold),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Gap(AppSizes.pH2),
                                      CustomText.primaryTitleMedium(
                                        '5k+ ratings',
                                        textStyle:
                                            TextStyle(color: ThemeColorLight.secondaryColor, fontSize: AppSizes.h8, fontWeight: AppFonts.regular),
                                      ),
                                    ],
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional.centerStart,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      CustomText.headlineSmall(
                                        provider.merchantEntity!.categories.first.title,
                                        textStyle: textTheme(context).headlineSmall!.copyWith(fontWeight: AppFonts.semiBold),
                                      ),
                                      Gap(AppSizes.pH3),
                                      CustomText.headlineLarge(
                                        provider.merchantEntity!.title,
                                      ),
                                      Gap(AppSizes.pH8),
                                      Row(
                                        children: [
                                          CustomText.headlineMedium(
                                            provider.merchantEntity!.tags!.first,
                                            textStyle: textTheme(context).headlineMedium!.copyWith(fontWeight: AppFonts.regular),
                                          ),
                                          Gap(AppSizes.pW7),
                                          CustomText.primaryTitleMedium(
                                            '• All tags',
                                            textStyle: textTheme(context).titleMedium!.copyWith(fontWeight: AppFonts.regular, fontSize: AppSizes.h6),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                                Gap(AppSizes.pH9),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    GestureDetector(
                                      behavior: HitTestBehavior.opaque,
                                      onTap: () {
                                        sendEmail(provider.merchantEntity!.email!);
                                      },
                                      child: CustomPngImage(
                                        path: AppAssets.callPng,
                                        height: AppSizes.icon45,
                                      ),
                                    ),
                                    GestureDetector(
                                      behavior: HitTestBehavior.opaque,
                                      onTap: () {
                                        sendEmail(provider.merchantEntity!.email!);

                                        callUs(provider.merchantEntity!.phone!);
                                      },
                                      child: CustomPngImage(
                                        path: AppAssets.emailPng,
                                        height: AppSizes.icon45,
                                      ),
                                    ),
                                    GestureDetector(
                                      behavior: HitTestBehavior.opaque,
                                      onTap: () {
                                        openMapsDirections(
                                            31, 29, provider.merchantEntity!.location!.latitude, provider.merchantEntity!.location!.longitude);
                                      },
                                      child: CustomPngImage(
                                        path: AppAssets.directionsPng,
                                        height: AppSizes.icon45,
                                      ),
                                    ),
                                    CustomPngImage(
                                      path: AppAssets.reportPng,
                                      height: AppSizes.icon45,
                                    ),
                                    GestureDetector(
                                      behavior: HitTestBehavior.opaque,
                                      onTap: () {
                                        Share.share('check out our website https://zarafa.app/');
                                      },
                                      child: CustomPngImage(
                                        path: AppAssets.sharePng,
                                        height: AppSizes.icon45,
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
            )));
  }
}
