class OfferEntity {
  String title;
  String description;
  String availableDateTime;
  bool isFlashDeal;
  bool hasDiscount;

  OfferEntity({
    required this.title,
    required this.description,
    required this.availableDateTime,
    required this.isFlashDeal,
    required this.hasDiscount,
  });
}
