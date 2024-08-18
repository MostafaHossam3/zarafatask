import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:ztask/core/utils/app_assets.dart';
import 'package:ztask/core/utils/app_constants.dart';
import 'package:ztask/core/utils/app_fonts.dart';
import 'package:ztask/core/utils/app_sizes.dart';
import 'package:ztask/core/widgets/custom_switch_widget.dart';
import 'package:ztask/core/widgets/custom_text.dart';
import 'package:ztask/core/widgets/images/custom_png_image.dart';
import 'package:ztask/core/widgets/images/custom_svg_image.dart';
import 'package:ztask/core/widgets/loading_indicators.dart';
import 'package:ztask/features/home/presentation/components/banner_component.dart';
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
              SingleChildScrollView(
                child: Column(
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
                      weekendDays: const [],
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
                      rowHeight: 95.h,
                      daysOfWeekStyle: DaysOfWeekStyle(
                          weekdayStyle: Theme.of(context).textTheme.titleMedium!, weekendStyle: Theme.of(context).textTheme.titleMedium!),
                    ),
                    Gap(AppSizes.pH8),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: AppSizes.pW4),
                      child: Column(
                        children: [
                          Row(
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
                          Gap(AppSizes.pH8),
                          AnimatedOpacity(
                            duration: Duration(milliseconds: 300),
                            opacity: provider.isLoading ? 0 : 1,
                            child: ListView(
                              shrinkWrap: true,
                              padding: EdgeInsets.zero,
                              physics: const NeverScrollableScrollPhysics(),
                              children: [
                                BannerComponent(
                                  duration: Duration(milliseconds: 300),
                                  image: AppAssets.imageBanner2,
                                  subtitle: 'Trip to Rome',
                                  title: 'Discuss a trip',
                                  tag: 'Work',
                                  date: '10:00 - 10:20 AM',
                                  participantsImages: [
                                    'https://i.pinimg.com/280x280_RS/1d/09/06/1d09066657ccd96be988027e12df4fd6.jpg',
                                    'https://img.freepik.com/premium-photo/girl-model-hd-images-free-download-with-wallpaper-product-model-girl-ads-girl-model_88650-3043.jpg',
                                    'https://static.vecteezy.com/system/resources/previews/029/640/165/large_2x/beautiful-indian-female-model-in-formal-cloth-generative-ai-photo.jpeg',
                                  ],
                                ),
                                BannerComponent(
                                  duration: Duration(milliseconds: 600),
                                  image: AppAssets.imageBanner3,
                                  subtitle: 'Trip to Rome',
                                  title: 'Discuss a trip with Tom',
                                  tag: 'High',
                                  date: '11:00 - 12:30 AM',
                                  participantsImages: [
                                    'https://lh3.googleusercontent.com/-Cm435RMAH4I/AAAAAAAAAAI/AAAAAAAAAAA/ALKGfkl4p0UyVAJCxPmmkljq_55bpjvY7w/photo.jpg?sz=46'
                                  ],
                                ),
                                BannerComponent(
                                  duration: Duration(milliseconds: 900),
                                  image: AppAssets.imageBanner4,
                                  subtitle: 'Evening routine',
                                  title: 'Lunch in café',
                                  tag: 'Life',
                                  date: '13:00 - 14:30 PM',
                                  participantsImages: [
                                    'https://www.papodecinema.com.br/wp-content/uploads/2019/12/20201229-jude-law-papo-de-cinema-e1609257686154.jpg',
                                    'https://i.pinimg.com/280x280_RS/1d/09/06/1d09066657ccd96be988027e12df4fd6.jpg',
                                  ],
                                ),
                                BannerComponent(
                                  duration: Duration(milliseconds: 1200),
                                  image: AppAssets.imageBanner1,
                                  subtitle: 'Evening routine',
                                  title: 'Lunch in café',
                                  tag: 'Life',
                                  date: '10:00 - 10:20 AM',
                                  participantsImages: [
                                    'https://i.pinimg.com/280x280_RS/1d/09/06/1d09066657ccd96be988027e12df4fd6.jpg',
                                    'https://img.freepik.com/premium-photo/girl-model-hd-images-free-download-with-wallpaper-product-model-girl-ads-girl-model_88650-3043.jpg',
                                    'https://static.vecteezy.com/system/resources/previews/029/640/165/large_2x/beautiful-indian-female-model-in-formal-cloth-generative-ai-photo.jpeg',
                                  ],
                                ),
                                Gap(80.h)
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Gap(AppSizes.pH8),
                  ],
                ),
              ),
              Positioned(
                bottom: 0,
                child: Container(
                  height: 100.h,
                  width: AppSizes.widthFullScreen, // Adjust height as needed
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [
                        Colors.black.withOpacity(1), // Fully black at the bottom
                        Colors.black.withOpacity(.8), // Fully black at the bottom
                        Colors.black.withOpacity(0.0), // Transparent at the top
                      ],
                    ),
                  ),
                ),
                // CustomPngImage(
                //   path: AppAssets.bImage,
                //   width: AppSizes.widthFullScreen,
                // )
              ),
              Positioned(
                bottom: 0,
                child: Container(
                  height: 100.h,
                  width: AppSizes.widthFullScreen, // Adjust height as needed
                  decoration: BoxDecoration(image: DecorationImage(image: AssetImage(AppAssets.maskGroupPng))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CustomPngImage(
                        path: AppAssets.homeIconPng,
                        width: AppSizes.icon25,
                        color: Colors.white38.withOpacity(.8),
                      ),
                      CustomPngImage(
                        path: AppAssets.calendarIconPng,
                        width: 22.5.sp,
                        color: Colors.white38.withOpacity(.8),
                      ),
                      CustomPngImage(
                        path: AppAssets.unionIconPng,
                        width: 20.sp,
                        color: Colors.white38.withOpacity(.8),
                      ),
                      CustomPngImage(
                        path: AppAssets.chatIconPng,
                        width: AppSizes.icon25,
                        color: Colors.white38.withOpacity(.8),
                      ),
                      CustomPngImage(
                        path: AppAssets.searchIconPng,
                        width: AppSizes.icon25,
                        color: Colors.white38.withOpacity(.8),
                      ),
                    ],
                  ),
                ),
                // CustomPngImage(
                //   path: AppAssets.bImage,
                //   width: AppSizes.widthFullScreen,
                // )
              ),
              if (provider.isLoading)
                Center(child: CustomLoadingIndicators.iOSLoadingIndicator()),
            ],
          ),
        ),
      ),
    );
  }
}
