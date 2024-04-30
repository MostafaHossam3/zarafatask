import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:ztask/core/services/status_bar_manager.dart';
import 'package:ztask/core/utils/app_assets.dart';
import 'package:ztask/core/utils/app_sizes.dart';
import 'package:ztask/core/utils/app_sizes.dart';
import 'package:ztask/features/splash/presentation/controllers/splash_provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    StatusBarManager.setTransparentWithNormalIconColor(context: context);
    return ChangeNotifierProvider<SplashScreenProvider>(
      create: (context) => SplashScreenProvider(),
      child: Consumer<SplashScreenProvider>(
        builder: (context, provider, child) => Scaffold(
            extendBody: true,
            body: Center(
                child: Lottie.asset(
              AppAssets.splashImage,
              frameRate: FrameRate.max,
              height: AppSizes.splashIconSize,
              width: AppSizes.splashIconSize,
              onLoaded: (composition) {
                _controller
                  ..duration = composition.duration
                  ..forward().whenComplete(() => provider.finishAnim());
              },
              repeat: false,
            ))),
      ),
    );
  }
}
