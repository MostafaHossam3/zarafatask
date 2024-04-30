import 'package:flutter/material.dart';
import 'package:ztask/core/global/theme/theme_color/theme_color_light.dart';
import 'package:ztask/core/utils/app_constants.dart';
import 'package:ztask/core/utils/app_constants.dart';
import 'package:ztask/core/utils/app_fonts.dart';
import 'package:ztask/core/utils/app_sizes.dart';
import 'package:ztask/core/utils/utils.dart';
import 'package:ztask/core/widgets/custom_text.dart';

class SortingRow extends StatefulWidget {
  final void Function(String value) onSelected;

  const SortingRow({super.key, required this.onSelected});

  @override
  State<SortingRow> createState() => _SortingRowState();
}

class _SortingRowState extends State<SortingRow> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
            AppConstants.sortingCases.length,
            (index) => GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedIndex = index;
                      widget.onSelected(AppConstants.sortingCases[index]);
                    });
                  },
                  child: Padding(
                    padding: EdgeInsetsDirectional.only(end: AppSizes.pW2),
                    child: selectedIndex == index
                        ? _SelectedSortingCase(caseKey: AppConstants.sortingCases[index])
                        : _UnSelectedSortingCase(caseKey: AppConstants.sortingCases[index]),
                  ),
                )),
      ),
    );
  }
}

class _SelectedSortingCase extends StatelessWidget {
  final String caseKey;

  const _SelectedSortingCase({required this.caseKey});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: ThemeColorLight.tertiaryColor, borderRadius: BorderRadius.circular(AppSizes.br13)),
      padding: EdgeInsets.symmetric(vertical: AppSizes.pH1, horizontal: AppSizes.pW5),
      child: CustomText.headlineMedium(
        caseKey,
        textAlign: TextAlign.start,
        textStyle: textTheme(context).headlineMedium?.copyWith(height: 1.5, color: ThemeColorLight.secondaryColor, fontWeight: AppFonts.medium),
      ),
    );
  }
}

class _UnSelectedSortingCase extends StatelessWidget {
  final String caseKey;

  const _UnSelectedSortingCase({required this.caseKey});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: ThemeColorLight.lightGreyColor, borderRadius: BorderRadius.circular(AppSizes.br13)),
      padding: EdgeInsets.symmetric(vertical: AppSizes.pH1, horizontal: AppSizes.pW5),
      child: CustomText.headlineMedium(
        caseKey,
        textAlign: TextAlign.start,
        textStyle: textTheme(context).headlineMedium?.copyWith(height: 1.5, color: ThemeColorLight.primaryColor, fontWeight: AppFonts.medium),
      ),
    );
  }
}
