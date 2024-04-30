import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:ztask/core/global/theme/theme_color/theme_color_light.dart';
import 'package:ztask/core/services/navigation_services.dart';
import 'package:ztask/core/services/status_bar_manager.dart';
import 'package:ztask/core/utils/app_sizes.dart';
import 'package:ztask/core/widgets/custom_text.dart';
import 'package:ztask/core/widgets/images/custom_network_image.dart';
import 'package:ztask/features/merchant/domain/entities/merchant_entity.dart';
import 'package:ztask/features/merchant/presentation/screens/merchant_details_screen.dart';

class MerchantItemComponent extends StatelessWidget {
  final MerchantEntity merchantEntity;

  const MerchantItemComponent({super.key, required this.merchantEntity});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await NavigationService.navigateTo(navigationMethod: NavigationMethod.push, page: () => const MerchantDetailsScreen());
        if (context.mounted) StatusBarManager.setLikeAppBarColor(context: context);
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              width: 75.sp,
              height: 75.sp,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(AppSizes.br13), border: Border.all(color: ThemeColorLight.lightGreyColor, width: 1.5)),
              child: CustomNetworkImage(
                imageUrl: merchantEntity.logo,
                fit: BoxFit.fill,
              )),
          Gap(AppSizes.pW4),
          Padding(
            padding: EdgeInsets.only(top: AppSizes.pH2),
            child: CustomText.primaryTitleLarge(merchantEntity.title),
          )
        ],
      ),
    );
  }
}
