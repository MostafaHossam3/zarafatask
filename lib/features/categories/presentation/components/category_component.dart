import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:ztask/core/global/theme/theme_color/theme_color_light.dart';
import 'package:ztask/core/services/navigation_services.dart';
import 'package:ztask/core/utils/app_fonts.dart';
import 'package:ztask/core/utils/app_sizes.dart';
import 'package:ztask/core/utils/utils.dart';
import 'package:ztask/core/widgets/custom_text.dart';
import 'package:ztask/core/widgets/images/custom_network_image.dart';
import 'package:ztask/features/categories/domain/entities/category_entity.dart';
import 'package:ztask/features/categories/presentation/screens/category_details_screen.dart';

class CategoryComponent extends StatelessWidget {
  final CategoryEntity categoryEntity;

  const CategoryComponent({super.key, required this.categoryEntity});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => NavigationService.navigateTo(navigationMethod: NavigationMethod.push, page: () => CategoryDetailsScreen(categoryEntity: categoryEntity,)),
      behavior: HitTestBehavior.opaque,
      child: Container(
        width: (AppSizes.widthFullScreen - 64.w) / 3,
        height: 185.h,
        decoration: BoxDecoration(color: ThemeColorLight.tertiaryColor, borderRadius: BorderRadius.circular(AppSizes.br12)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Align(
              alignment: AlignmentDirectional.topEnd,
              child: Container(
                width: AppSizes.icon25,
                height: AppSizes.icon25,
                alignment: Alignment.center,
                margin: EdgeInsets.all(AppSizes.pH1),
                decoration: BoxDecoration(color: ThemeColorLight.secondaryColor, borderRadius: BorderRadius.circular(AppSizes.brMax)),
                child: CustomText.displayMedium(
                  categoryEntity.merchantCount.toString(),
                  textStyle: textTheme(context).displayMedium!.copyWith(fontSize: AppSizes.h6, fontWeight: AppFonts.bold),
                ),
              ),
            ),
            CustomNetworkImage(
              imageUrl: categoryEntity.iconPath,
              width: AppSizes.icon45,
              height: AppSizes.icon45,
            ),
            Gap(AppSizes.pH7),
            CustomText.primaryTitleMedium(categoryEntity.title,),
          ],
        ),
      ),
    );
  }
}
