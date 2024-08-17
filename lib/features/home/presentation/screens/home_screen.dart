import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:ztask/core/utils/app_assets.dart';
import 'package:ztask/core/utils/app_constants.dart';
import 'package:ztask/core/utils/app_fonts.dart';
import 'package:ztask/core/utils/app_sizes.dart';
import 'package:ztask/core/widgets/custom_switch_widget.dart';
import 'package:ztask/core/widgets/custom_text.dart';
import 'package:ztask/core/widgets/images/custom_png_image.dart';
import 'package:ztask/features/home/presentation/controllers/home_screen_provider.dart';
import 'package:ztask/features/home/presentation/utils/utils.dart';
import 'package:ztask/features/home/presentation/widgets/table_calender.dart' as ctc;

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final defaultDayStyle = Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: AppSizes.h5);
    return Scaffold(
      backgroundColor: Colors.black,
      body: ChangeNotifierProvider(
        create: (context) => HomeScreenProvider(),
        child: Consumer<HomeScreenProvider>(
          builder: (context, provider, child) => Stack(
            children: [
              CustomPngImage(path: AppAssets.bgPng, fit: BoxFit.fill, width: AppSizes.widthFullScreen, height: AppSizes.heightFullScreen),
              Column(
                children: [
                  Gap(AppSizes.pH10),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: AppSizes.pW4),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: CustomText.primaryTitleLarge(
                            'Your today’s \nAgenda',
                            maxLines: 2,
                            textAlign: TextAlign.start,
                            textStyle: Theme.of(context).textTheme.titleLarge!.copyWith(height: 1.1, fontSize: AppSizes.h2),
                          ),
                        ),
                        const CustomPngImage(path: AppAssets.sortPng),
                        Gap(AppSizes.pH2),
                        const CustomPngImage(path: AppAssets.addPng),
                      ],
                    ),
                  ),
                  Gap(AppSizes.pH8),
                  ctc.TableCalendar(
                    holidayPredicate: (day) => false,
                    weekendDays: [],
                    startingDayOfWeek: StartingDayOfWeek.sunday,
                    firstDay: DateTime.utc(2010, 10, 16),
                    lastDay: DateTime.utc(2030, 3, 14),
                    focusedDay: provider.selectedDate,
                    calendarFormat: CalendarFormat.week,
                    onDaySelected: (selectedDay, focusedDay) {
                      provider.setSelectedDate(selectedDay);
                    },
                    selectedDayPredicate: (day) => day.isSameDate(provider.selectedDate),
                    headerVisible: false,
                    daysOfWeekVisible: false,
                    calendarStyle: CalendarStyle(
                      defaultTextStyle: defaultDayStyle,
                      selectedTextStyle: Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: AppSizes.h4, fontWeight: AppFonts.medium),
                      weekendTextStyle: defaultDayStyle,
                      holidayTextStyle: defaultDayStyle,
                      disabledTextStyle: defaultDayStyle,
                      outsideTextStyle: defaultDayStyle,
                      selectedDecoration: const BoxDecoration(),
                      todayDecoration: const BoxDecoration(),
                    ),
                    rowHeight: 102.h,
                    daysOfWeekStyle: DaysOfWeekStyle(
                        weekdayStyle: Theme.of(context).textTheme.titleMedium!, weekendStyle: Theme.of(context).textTheme.titleMedium!),
                  ),
                  Gap(AppSizes.pH8),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: AppSizes.pW4),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText.primaryTitleLarge(
                              DateFormat('EEEE d').format(provider.selectedDate),
                              maxLines: 2,
                              textAlign: TextAlign.start,
                              textStyle: Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: AppSizes.h3),
                            ),
                            Gap(AppSizes.pH3),
                            CustomText.primaryTitleMedium(
                              '4 events',
                              maxLines: 2,
                              textAlign: TextAlign.start,
                              textStyle: Theme.of(context).textTheme.titleMedium!.copyWith(fontSize: AppSizes.h5),
                            ),
                          ],
                        ),
                        CustomSwitchWidget(
                          onChange: (value) => provider.changeListState(value),
                        ),
                      ],
                    ),
                  ),
                  Gap(AppSizes.pH8),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
