import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ztask/core/services/navigation_services.dart';
import 'package:ztask/features/categories/presentation/screens/categories_screen.dart';

class SplashScreenProvider with ChangeNotifier {
  finishAnim() {
    NavigationService.navigateTo(
        navigationMethod: NavigationMethod.pushReplacement, page: () => const CategoriesScreen(), transition: Transition.leftToRight);
  }
}
