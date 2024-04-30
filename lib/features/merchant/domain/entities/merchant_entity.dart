import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:ztask/features/categories/domain/entities/category_entity.dart';
import 'package:ztask/features/merchant/domain/entities/offer_entity.dart';

class MerchantEntity {
  String title;
  String logo;
  String? brandImage;
  String? phone;
  String? email;
  LatLng? location;
  List<CategoryEntity> categories;
  List<CategoryEntity> subCategories;
  List<String>? tags;
  List<OfferEntity>? offers;
  double? rating;

  // Constructor
  MerchantEntity({
    required this.title,
    required this.logo,
    this.brandImage,
    this.phone,
    this.email,
    this.location,
    this.categories = const [],
    this.subCategories = const [],
    this.tags,
    this.offers,
    this.rating,
  });

}
