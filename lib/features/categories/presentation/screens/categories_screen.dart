import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:ztask/core/services/status_bar_manager.dart';
import 'package:ztask/core/utils/app_assets.dart';
import 'package:ztask/core/utils/app_constants.dart';
import 'package:ztask/core/utils/app_sizes.dart';
import 'package:ztask/core/widgets/custom_text.dart';
import 'package:ztask/core/widgets/custom_text_form_field.dart';
import 'package:ztask/core/widgets/images/custom_png_image.dart';
import 'package:ztask/core/widgets/images/custom_svg_image.dart';
import 'package:ztask/core/widgets/loading_indicators.dart';
import 'package:ztask/features/categories/presentation/components/category_component.dart';
import 'package:ztask/features/categories/presentation/controllers/categories_provider.dart';
import 'package:ztask/features/categories/presentation/widgets/search_categories_widget.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    StatusBarManager.setLikeAppBarColor(context: context);
    return ChangeNotifierProvider<CategoriesProvider>(
      create: (context) => CategoriesProvider(),
      child: SafeArea(
        child: Scaffold(
          body: ListView(
            padding: EdgeInsets.symmetric(vertical: AppSizes.pH7, horizontal: AppSizes.pW6),
            children: [
              CustomText.primaryTitleLarge('Categories', textAlign: TextAlign.start),
              Gap(AppSizes.pH8),
              const SearchCategoriesWidget(),
              Gap(AppSizes.pH8),
              CustomText.primaryTitleLarge('Popular Categories', textAlign: TextAlign.start),
              Gap(AppSizes.pH9),
              Consumer<CategoriesProvider>(builder: (context, provider, _) {
                return AnimatedSize(
                  duration: AppConstants.animationMediumDuration,
                  child: provider.isLoadingPopularCategories
                      ? CustomLoadingIndicators.iOSLoadingIndicator()
                      : Wrap(
                        spacing: AppSizes.pW4,
                        runSpacing: AppSizes.pH7,
                        children: List.generate(
                            provider.popularCategories.length, (index) => CategoryComponent(categoryEntity: provider.popularCategories[index])),
                      ),
                );
              }),
              Gap(AppSizes.pH8),
              CustomText.primaryTitleLarge('All Categories', textAlign: TextAlign.start),
              Gap(AppSizes.pH9),
              Consumer<CategoriesProvider>(builder: (context, provider, _) {
                return AnimatedSize(
                  duration: AppConstants.animationMediumDuration,
                  child: provider.isLoadingAllCategories
                      ? CustomLoadingIndicators.iOSLoadingIndicator()
                      : Wrap(
                        spacing: AppSizes.pW4,
                        runSpacing: AppSizes.pH7,
                        children: List.generate(
                            provider.allCategories.length, (index) => CategoryComponent(categoryEntity: provider.allCategories[index])),
                      ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
