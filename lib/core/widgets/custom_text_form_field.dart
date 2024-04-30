import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ztask/core/utils/app_sizes.dart';
import 'package:ztask/core/utils/utils.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    this.controller,
    this.hintText,
    this.textInputAction,
    this.textDirection,
    this.onChanged,
    this.maxLines = 1,
    this.minLines = 1,
    this.maxLength,
    this.inputFormatters,
    this.suffix,
    this.prefixIcon,
    this.focusNode,
  });

  final TextEditingController? controller;
  final String? hintText;
  final TextInputAction? textInputAction;
  final TextDirection? textDirection;
  final ValueChanged<String>? onChanged;
  final int? maxLines;
  final int? minLines;
  final int? maxLength;
  final List<TextInputFormatter>? inputFormatters;
  final Widget? suffix;
  final Widget? prefixIcon;
  final FocusNode? focusNode;


  @override
  Widget build(BuildContext context) {
    return TextFormField(
        controller: controller,
        maxLines: maxLines,
        minLines: minLines,
        textInputAction: textInputAction,
        textAlignVertical: TextAlignVertical.center,
        style:  textTheme(context).titleMedium!,
        textDirection: textDirection,
        inputFormatters: inputFormatters,
        onChanged: onChanged,
        focusNode: focusNode,
        maxLength: maxLength,
        cursorColor: Theme.of(context).inputDecorationTheme.border!.borderSide.color,
        decoration: (const InputDecoration()).applyDefaults(Theme.of(context).inputDecorationTheme).copyWith(
              counterText: "",
              counterStyle: const TextStyle(
                height: double.minPositive,
              ),
              fillColor: Theme.of(context).inputDecorationTheme.fillColor,
              filled: true,
              contentPadding: EdgeInsets.symmetric(
                horizontal: AppSizes.pW5,
                vertical: 0,
              ),
              focusedBorder: Theme.of(context).inputDecorationTheme.focusedBorder,
              enabledBorder: Theme.of(context).inputDecorationTheme.enabledBorder,
              border: Theme.of(context).inputDecorationTheme.border,
              hintText: hintText,
              hintStyle: Theme.of(context).inputDecorationTheme.hintStyle,
              suffixIcon: suffix,
              prefixIcon: prefixIcon,
              errorStyle: Theme.of(context).inputDecorationTheme.errorStyle,
              disabledBorder: Theme.of(context).inputDecorationTheme.disabledBorder,
            ));
  }
}
