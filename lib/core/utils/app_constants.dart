import 'package:flutter/services.dart';

class AppConstants {

  /// Duration Time
  static const int splashTimeDelay = 2;
  static const int animationDefaultTime = 200;
  static const Duration animationDefaultDuration = Duration(milliseconds: 200);
  static const Duration animationMediumDuration = Duration(milliseconds: 300);
  static const Duration shortAnimationDefaultDuration = Duration(milliseconds: 150);
  static const Duration animationLongDuration = Duration(milliseconds: 400);

  /// Pagination
  static const int defaultPageSize = 16;
  static const int defaultPageSizeGallery = 20;

  static final List<String> sortingCases = [
    'All',
    'A',
    'B',
    'C',
    'D',
    'E',
    'F',
    'G',
    'H',
    'I',
    'J',
    'K',
    'L',
    'M',
    'N',
    'O',
    'P',
    'Q',
    'R',
    'S',
    'T',
    'U',
    'V',
    'W',
    'X',
    'Y',
    'Z'
  ];
}