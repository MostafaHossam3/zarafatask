import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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

class SubCategoryComponent extends StatelessWidget {
  final CategoryEntity categoryEntity;
  final bool isSelected;

  const SubCategoryComponent({super.key, required this.categoryEntity, this.isSelected = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(end: AppSizes.pW4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: (AppSizes.widthFullScreen - 78.w) / 4,
            height: (AppSizes.widthFullScreen - 78.w) / 4,
            decoration: BoxDecoration(
                color: ThemeColorLight.tertiaryColor,
                border: Border.all(color: isSelected ? ThemeColorLight.secondaryColor : Colors.transparent),
                borderRadius: BorderRadius.circular(AppSizes.br12)),
            alignment: Alignment.center,
            child: CustomNetworkImage(
              imageUrl: categoryEntity.iconPath,
              fit: BoxFit.fitHeight,
              height: AppSizes.icon35,
            ),
          ),
          Gap(AppSizes.pH5),
          CustomText.primaryTitleMedium(
            categoryEntity.title,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
