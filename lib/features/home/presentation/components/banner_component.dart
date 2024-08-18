import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:signed_spacing_flex/signed_spacing_flex.dart';
import 'package:ztask/core/utils/app_assets.dart';
import 'package:ztask/core/utils/app_sizes.dart';
import 'package:ztask/core/widgets/custom_text.dart';

class BannerComponent extends StatelessWidget {
  final String image;
  final String subtitle;
  final String title;
  final String tag;
  final String date;
  final List<String> participantsImages;

  BannerComponent(
      {super.key,
      required this.image,
      required this.subtitle,
      required this.title,
      required this.tag,
      required this.date,
      required this.participantsImages});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppSizes.widthFullScreen,
      height: 190.h,
      padding: EdgeInsets.all(AppSizes.pW6),
      margin: EdgeInsets.only(bottom: AppSizes.pH4),
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(AppSizes.br30), image: DecorationImage(image: AssetImage(image), fit: BoxFit.fill)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText.primaryTitleMedium(
                subtitle,
                maxLines: 2,
                textAlign: TextAlign.start,
                textStyle: Theme.of(context).textTheme.titleMedium!.copyWith(fontSize: AppSizes.h5),
              ),
              Gap(AppSizes.pH3),
              CustomText.primaryTitleLarge(
                title,
                maxLines: 2,
                textAlign: TextAlign.start,
                textStyle: Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: AppSizes.h3),
              ),
              const Expanded(child: SizedBox()),
              CustomText.primaryTitleLarge(
                date,
                maxLines: 2,
                textAlign: TextAlign.start,
                textStyle: Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: AppSizes.h6),
              ),
              Gap(AppSizes.pH2),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                width: 65.w,
                height: 45.h,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.white10, borderRadius: BorderRadius.circular(AppSizes.brMax), border: Border.all(color: Colors.white10)),
                child: CustomText.primaryTitleLarge(
                  tag,
                  maxLines: 2,
                  textAlign: TextAlign.start,
                  textStyle: Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: AppSizes.h6),
                ),
              ),
              const Expanded(child: SizedBox()),
              SignedSpacingRow(
                spacing: -16.0,
                stackingOrder: StackingOrder.firstOnTop,
                children: List.generate(participantsImages.length, (index) {
                  return CircleAvatar(
                    backgroundColor: Colors.white10,
                    child: CircleAvatar(
                      backgroundColor: Colors.transparent,
                      backgroundImage: NetworkImage(participantsImages[index]),
                    ),
                  );
                }),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
