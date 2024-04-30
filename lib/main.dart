import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ztask/core/global/theme/theme_data/light.dart';
import 'package:ztask/core/services/services_initializer.dart';
import 'package:ztask/features/categories/presentation/screens/categories_screen.dart';
import 'package:ztask/features/splash/presentation/screens/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ServiceInitializer().initializeSettings();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: ScreenUtilInit(
        designSize: const Size(390, 891),
        minTextAdapt: false,
        builder: (_, __) => GetMaterialApp(
          title: 'Z-Task',
          debugShowCheckedModeBanner: false,
          theme: getThemeDataLight,
          home: const SplashScreen(),
        ),
      ),
    );
  }
}