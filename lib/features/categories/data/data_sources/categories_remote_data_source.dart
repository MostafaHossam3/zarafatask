import 'package:ztask/core/network/model/api_response.dart';
import 'package:ztask/features/categories/data/models/category_model.dart';
import 'package:ztask/features/merchant/data/models/merchant_model.dart';

///[Implementation]
abstract class CategoriesRemoteDataSource {

  Future<APIResponse<List<CategoryModel>>> getPopularCategories();
  Future<APIResponse<List<CategoryModel>>> getAllCategories();
  Future<APIResponse<List<MerchantModel>>> getCategoryMerchants(int categoryId);

}
