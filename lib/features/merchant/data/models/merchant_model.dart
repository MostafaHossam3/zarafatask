import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:ztask/features/categories/domain/entities/category_entity.dart';
import 'package:ztask/features/merchant/domain/entities/merchant_entity.dart';
import 'package:ztask/features/merchant/data/models/offer_model.dart';

class MerchantModel extends MerchantEntity {
  // Constructor
  MerchantModel({
    required super.title,
    required super.logo,
    super.brandImage,
    super.phone,
    super.email,
    super.location,
    super.categories = const [],
    super.subCategories = const [],
    super.tags,
    super.offers,
    super.rating,
  });

  // Method to convert from Map to MerchantModel
  factory MerchantModel.fromMap(Map<String, dynamic> map) {
    return MerchantModel(
      title: map['title'],
      brandImage: map['brandImage'],
      phone: map['phone'],
      email: map['email'],
      location: LatLng(map['location']['latitude'], map['location']['longitude']),
      logo: map['logo'],
      tags: List<String>.from(map['tags']),
      offers: List<OfferModel>.from(map['offers']),
      rating: map['rating'].toDouble(),
    );
  }

  // Method to convert from MerchantModel to Map
  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'brandImage': brandImage,
      'phone': phone,
      'email': email,
      'location': {'latitude': location?.latitude, 'longitude': location?.longitude},
      'logo': logo,
      'tags': tags,
      'offers': offers,
      'rating': rating,
    };
  }
}
