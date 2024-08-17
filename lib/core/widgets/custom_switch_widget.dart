import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ztask/core/utils/app_assets.dart';
import 'package:ztask/core/utils/app_constants.dart';
import 'package:ztask/core/utils/app_sizes.dart';
import 'package:ztask/core/widgets/images/custom_svg_image.dart';

class CustomSwitchWidget extends StatefulWidget {
  void Function(bool value) onChange;

  CustomSwitchWidget({super.key, required this.onChange});

  @override
  State<CustomSwitchWidget> createState() => _CustomSwitchWidgetState();
}

class _CustomSwitchWidgetState extends State<CustomSwitchWidget> {
  bool isEnabled = true;

  changeState() {
    setState(() {
      isEnabled = !isEnabled;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        changeState();
        widget.onChange.call(isEnabled);
      },
      child: Container(
        width: 90.w,
        height: 60.h,
        decoration: BoxDecoration(border: Border.all(color: Colors.white.withOpacity(0.2)), borderRadius: BorderRadius.circular(AppSizes.brMax)),
        // alignment: AlignmentDirectional.centerStart,
        child: Stack(
          children: [
            AnimatedAlign(
              alignment: isEnabled ? AlignmentDirectional.centerStart : AlignmentDirectional.centerEnd,
              duration: Duration(milliseconds: 100),
              child: Container(
                height: 60.h,
                width: 60.h - 4.w,
                margin: EdgeInsets.all(2.w),
                decoration: BoxDecoration(color: Colors.white.withOpacity(0.2), borderRadius: BorderRadius.circular(AppSizes.brMax)),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 40.w,
                  width: 40.w,
                  padding: EdgeInsetsDirectional.only(start: 4.w),
                  alignment: AlignmentDirectional.center,
                  child: CustomSvgImage(
                    path: AppAssets.calenderSvg,
                    color: isEnabled ? Colors.white : Colors.white70,
                  ),
                ),
                Container(
                  width: 40.w,
                  height: 40.w,
                  alignment: AlignmentDirectional.center,
                  child: CustomSvgImage(
                    path: AppAssets.listCheckSvg,
                    color: !isEnabled ? Colors.white : Colors.white70,
                    height: AppSizes.icon25,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
