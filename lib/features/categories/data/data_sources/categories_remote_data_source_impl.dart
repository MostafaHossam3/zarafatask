import 'package:injectable/injectable.dart';
import 'package:ztask/core/network/model/api_response.dart';
import 'package:ztask/features/categories/data/data_sources/categories_remote_data_source.dart';
import 'package:ztask/features/categories/data/models/category_model.dart';
import 'package:ztask/features/merchant/data/models/merchant_model.dart';

///[CategoriesRemoteDataSource]
///[Implementation]
@Injectable(as: CategoriesRemoteDataSource)
class CategoriesRemoteDataSourceImplement implements CategoriesRemoteDataSource {
  // final ApiCaller apiCaller;

  CategoriesRemoteDataSourceImplement();

  @override
  Future<APIResponse<List<CategoryModel>>> getPopularCategories() async {
    await Future.delayed(const Duration(seconds: 1));
    return APIResponse(success: true, data: _popularCategories);
  }

  @override
  Future<APIResponse<List<CategoryModel>>> getAllCategories() async {
    await Future.delayed(const Duration(seconds: 1));
    return APIResponse(success: true, data: _allCategories);
  }

  @override
  Future<APIResponse<List<MerchantModel>>> getCategoryMerchants(int categoryId) async {
    await Future.delayed(const Duration(seconds: 1));
    return APIResponse(success: true, data: _allMerchants);
  }
}

//// This is just lists for dummy data
List<CategoryModel> _popularCategories = [
  CategoryModel(
      id: 1,
      merchantCount: 10,
      children: _childrenCategories,
      title: 'Food',
      iconPath: 'https://lh3.googleusercontent.com/d/1aNWKuM4NaeG-1Ku9lIDTKKLAq7bRESPo'),
  CategoryModel(
      id: 2,
      merchantCount: 4,
      children: _childrenCategories,
      title: 'Toys & Games',
      iconPath: 'https://lh3.googleusercontent.com/d/1M7mlHkJGBoGRrSOBUJoh5QeZEkcIHX9O'),
  CategoryModel(
      id: 3,
      merchantCount: 7,
      children: _childrenCategories,
      title: 'Sports',
      iconPath: 'https://lh3.googleusercontent.com/d/1y-KKwLMWgkLcSIy8TPinnCSOktzDXpxW'),
];

List<CategoryModel> _allCategories = [
  CategoryModel(
      id: 4,
      merchantCount: 9,
      children: _childrenCategories,
      title: 'Gym',
      iconPath: 'https://lh3.googleusercontent.com/d/1sPKiNQgEj6djnJcqW1Da_Bepv441sIyw'),
  CategoryModel(
      id: 5,
      merchantCount: 14,
      children: _childrenCategories,
      title: 'Electrician',
      iconPath: 'https://lh3.googleusercontent.com/d/1queDLBOeqy0QgljA2b4e9YRfFUQWIuZX'),
  CategoryModel(
      id: 6,
      merchantCount: 4,
      children: _childrenCategories,
      title: 'Hotels',
      iconPath: 'https://lh3.googleusercontent.com/d/19cmlLERbnXeWTo3PLo0TWFwsTlxytLAl'),
  CategoryModel(
      id: 7,
      merchantCount: 5,
      children: _childrenCategories,
      title: 'Car Services',
      iconPath: 'https://lh3.googleusercontent.com/d/1gnJcCM2xOFmGtmpJgi-wNcEwIT6H0QHK'),
  CategoryModel(
      id: 8,
      merchantCount: 12,
      children: _childrenCategories,
      title: 'Beauty',
      iconPath: 'https://lh3.googleusercontent.com/d/1fB7gv5vO3aDUlpH-BFM0phw2FDBw3vex'),
  CategoryModel(
      id: 9,
      merchantCount: 18,
      children: _childrenCategories,
      title: 'Clothing',
      iconPath: 'https://lh3.googleusercontent.com/d/1pasDV88PGsmp3d1GNm8xTGWgSJPTI0x1'),
];

List<CategoryModel> _childrenCategories = [
  CategoryModel(id: 10, merchantCount: 0, title: 'Burger', iconPath: 'https://lh3.googleusercontent.com/d/1aNWKuM4NaeG-1Ku9lIDTKKLAq7bRESPo'),
  CategoryModel(id: 11, merchantCount: 0, title: 'Coffee', iconPath: 'https://lh3.googleusercontent.com/d/1pEd-GqE4TvKWHHnnXix_HbQRDBw9_cE3'),
  CategoryModel(id: 12, merchantCount: 0, title: 'Shawerma', iconPath: 'https://lh3.googleusercontent.com/d/12KEzREem6WhIHfAmlBVN54Bajnd7Iepi'),
  CategoryModel(id: 13, merchantCount: 0, title: 'Burger', iconPath: 'https://lh3.googleusercontent.com/d/1aNWKuM4NaeG-1Ku9lIDTKKLAq7bRESPo'),
];

List<MerchantModel> _allMerchants = [
  MerchantModel(title: "FreshDirect", logo: "https://lh3.googleusercontent.com/d/1DGe9bCmbQNrzjg0Yokvb9i9udkzEFBBI"),
  MerchantModel(title: "BJ’s", logo: "https://lh3.googleusercontent.com/d/1NxnjRCmWB74-Atn_udemLOiSeqQ0Hxpi"),
  MerchantModel(title: "Vitacost", logo: "https://lh3.googleusercontent.com/d/1VUWsWBcKQGiKLLG-MjG-9TVYLpPZdqhZ"),
  MerchantModel(title: "FreshDirect", logo: "https://lh3.googleusercontent.com/d/1vsWSWWiUc8-mZA3pYjf8BxcpYrc3uZWL"),
  MerchantModel(title: "BJ’s", logo: "https://lh3.googleusercontent.com/d/1xFmaoNzHYwnTl6z12B3sAlhGsBS7lGBY"),
  MerchantModel(title: "Vitacost", logo: "https://lh3.googleusercontent.com/d/1zzw4NZwaC0Dl-Xu4aCRlNlDqVPGrFoOH"),
];
