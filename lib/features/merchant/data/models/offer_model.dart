import 'package:ztask/features/merchant/domain/entities/offer_entity.dart';

class OfferModel extends OfferEntity {
  // Constructor
  OfferModel({
    required super.title,
    required super.description,
    required super.availableDateTime,
    required super.isFlashDeal,
    required super.hasDiscount,
  });

  // Method to convert from Map to OfferModel
  factory OfferModel.fromMap(Map<String, dynamic> map) {
    return OfferModel(
      title: map['title'],
      description: map['description'],
      availableDateTime: map['availableDateTime'],
      isFlashDeal: map['isFlashDeal'],
      hasDiscount: map['hasDiscount'],
    );
  }

  // Method to convert from OfferModel to Map
  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
      'availableDateTime': availableDateTime,
      'isFlashDeal': isFlashDeal,
      'hasDiscount': hasDiscount,
    };
  }
}
