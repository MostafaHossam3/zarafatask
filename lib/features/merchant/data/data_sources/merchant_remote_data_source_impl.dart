import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:ztask/core/network/model/api_response.dart';
import 'package:ztask/features/categories/data/data_sources/categories_remote_data_source.dart';
import 'package:ztask/features/categories/data/models/category_model.dart';
import 'package:ztask/features/merchant/data/models/merchant_model.dart';
import 'package:ztask/features/merchant/data/data_sources/merchant_remote_data_source.dart';
import 'package:ztask/features/merchant/data/models/offer_model.dart';

///[MerchantRemoteDataSource]
///[Implementation]
@Injectable(as: MerchantRemoteDataSource)
class MerchantRemoteDataSourceImplement implements MerchantRemoteDataSource {
  // final ApiCaller apiCaller;

  MerchantRemoteDataSourceImplement();

  @override
  Future<APIResponse<MerchantModel>> getMerchantDetails(int id) async {
    await Future.delayed(const Duration(seconds: 1));
    return APIResponse(success: true, data: _merchantModel);
  }
}

MerchantModel _merchantModel = MerchantModel(
  title: "Canton - Amman",
  brandImage: "https://lh3.googleusercontent.com/d/1tLlkILDVasxA6td6HM8AR1KXurWfGbiT",
  logo: "https://lh3.googleusercontent.com/d/1VUWsWBcKQGiKLLG-MjG-9TVYLpPZdqhZ",
  location: const LatLng(31.963158, 35.930359),
  categories: [
    CategoryModel(id: 1, merchantCount: 10, title: 'Food', iconPath: 'https://lh3.googleusercontent.com/d/1aNWKuM4NaeG-1Ku9lIDTKKLAq7bRESPo'),
  ],
  email: 'Mostafa.hossam.cs@gmail.com',
  phone: '+201091622187',
  rating: 4.1,
  offers: [
    OfferModel(title: '25% off total bill', description: '', availableDateTime: 'Available from 05:00 PM - 02:00 AM', isFlashDeal: true, hasDiscount: false),
    OfferModel(title: '25% off total bill', description: 'INCLUDED IN MOBILE PRODUCT . NOT YET PURCHASED', availableDateTime: '', isFlashDeal: true, hasDiscount: false),
    OfferModel(title: 'Chicken, beef or shrimp dish', description: 'INCLUDED IN MOBILE PRODUCT . NOT YET PURCHASED', availableDateTime: '', isFlashDeal: true, hasDiscount: false),
    OfferModel(title: '35% off Zamrad perfume', description: '', availableDateTime: 'During operating hours', isFlashDeal: true, hasDiscount: false),
    OfferModel(title: 'Chicken, beef or shrimp dish', description: 'INCLUDED IN MOBILE PRODUCT . NOT YET PURCHASED', availableDateTime: 'availableDateTime', isFlashDeal: true, hasDiscount: false),
  ],
  tags: [
    "Chinese # Chicken # Salads # Soup",
  ],
);
