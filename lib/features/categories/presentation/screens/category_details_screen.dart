import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:ztask/core/global/theme/theme_color/theme_color_light.dart';
import 'package:ztask/core/services/status_bar_manager.dart';
import 'package:ztask/core/utils/app_assets.dart';
import 'package:ztask/core/utils/app_constants.dart';
import 'package:ztask/core/utils/app_fonts.dart';
import 'package:ztask/core/utils/app_sizes.dart';
import 'package:ztask/core/utils/utils.dart';
import 'package:ztask/core/widgets/custom_back_button.dart';
import 'package:ztask/core/widgets/custom_text.dart';
import 'package:ztask/core/widgets/images/custom_png_image.dart';
import 'package:ztask/core/widgets/loading_indicators.dart';
import 'package:ztask/features/categories/domain/entities/category_entity.dart';
import 'package:ztask/features/categories/presentation/components/sorting_row.dart';
import 'package:ztask/features/categories/presentation/components/sub_category_component.dart';
import 'package:ztask/features/categories/presentation/controllers/sub_categories_provider.dart';
import 'package:ztask/features/merchant/presentation/components/merchant_item_component.dart';

class CategoryDetailsScreen extends StatelessWidget {
  final CategoryEntity categoryEntity;

  const CategoryDetailsScreen({super.key, required this.categoryEntity});

  @override
  Widget build(BuildContext context) {
    StatusBarManager.setLikeAppBarColor(context: context);
    return ChangeNotifierProvider<SubCategoriesProvider>(
      create: (context) => SubCategoriesProvider(),
      child: SafeArea(
        child: Scaffold(
          body: ListView(
            padding: EdgeInsets.symmetric(vertical: AppSizes.pH7, horizontal: AppSizes.pW6),
            children: [
              Row(
                children: [const CustomBackButton(), CustomText.primaryTitleLarge(categoryEntity.title, textAlign: TextAlign.start)],
              ),
              Gap(AppSizes.pH8),
              CustomText.primaryTitleLarge('Sub Category', textAlign: TextAlign.start),
              Gap(AppSizes.pH9),
              Consumer<SubCategoriesProvider>(builder: (context, provider, _) {
                return SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: List.generate(
                        categoryEntity.children.length, (index) => GestureDetector(
                        onTap: () => provider.setSelectedCategoryIndex(index),
                        child: SubCategoryComponent(
                            isSelected: index == provider.selectedCategoryIndex,
                            categoryEntity: categoryEntity.children[index]))),
                  ),
                );
              }),
              Gap(AppSizes.pH10),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText.primaryTitleLarge('All Offers For Food, Drinks &\n Restaurants', textAlign: TextAlign.start),
                  const Expanded(child: SizedBox()),
                  CustomPngImage(path: AppAssets.searchMagIconPng, width: AppSizes.icon25),
                  Gap(AppSizes.pW2),
                  CustomText.primaryTitleMedium(
                    'Sort',
                    textAlign: TextAlign.start,
                    textStyle:
                        textTheme(context).titleMedium?.copyWith(height: 1.5, color: ThemeColorLight.secondaryColor, fontWeight: AppFonts.medium),
                  ),
                  const Icon(Icons.keyboard_arrow_down, color: ThemeColorLight.secondaryColor)
                ],
              ),
              Gap(AppSizes.pH7),
              Consumer<SubCategoriesProvider>(
                builder: (context, provider, child) => provider.isLoadingMerchants
                    ? CustomLoadingIndicators.iOSLoadingIndicator()
                    : Column(
                      children: [
                        SortingRow(
                          onSelected: (value) => provider.setSortingCase(value),
                        ),
                        Gap(AppSizes.pH8),
                        ...List.generate(
                            provider.merchants.length,
                            (index) => Padding(
                                padding: EdgeInsets.only(bottom: AppSizes.pH7),
                                child: MerchantItemComponent(
                                  merchantEntity: provider.merchants[index],
                                ))),
                      ],
                    ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
