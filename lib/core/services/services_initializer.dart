import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ztask/src/dependency_injection/dependency_injection.dart';

class ServiceInitializer {
  ServiceInitializer._();

  static final ServiceInitializer instance = ServiceInitializer._();

  factory ServiceInitializer() => instance;

  initializeSettings() async {
    List futures = [
      initializeDependencyInjection(),
      initializeScreensOrientation(),
      //getSavedLocal(),
      //initializeFirebase(),
      //initializeSession(),
    ];
    await Future.wait<dynamic>([...futures]);
  }

  initializeDependencyInjection() async {
    await configureDependencies();
  }

  initializeScreensOrientation() async {
    await SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown],
    );
  }
}
