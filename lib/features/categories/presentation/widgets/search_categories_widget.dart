import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:ztask/core/utils/app_assets.dart';
import 'package:ztask/core/widgets/custom_text_form_field.dart';
import 'package:ztask/core/widgets/images/custom_png_image.dart';
import 'package:ztask/features/categories/presentation/controllers/categories_provider.dart';

class SearchCategoriesWidget extends StatelessWidget {

  const SearchCategoriesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CategoriesProvider>(
      builder: (context, provider, _) {
        return CustomTextFormField(
          hintText: 'Search categories',
          onChanged: (value) => provider.onSearchTextChange(value),
          controller: provider.searchController,
          prefixIcon: CustomPngImage(
            path: AppAssets.searchIconPng,
            height: 7.sp,
          ),
        );
      }
    );
  }
}
