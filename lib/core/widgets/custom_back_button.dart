import 'package:flutter/material.dart';
import 'package:ztask/core/services/navigation_services.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () => NavigationService.goBack(),
        child: Icon(Icons.arrow_back_ios, color: Theme.of(context).primaryColor));
  }
}
