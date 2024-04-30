import 'package:eitherx/eitherx.dart';
import 'package:ztask/core/error/failure.dart';
import 'package:ztask/core/network/model/api_response.dart';
import 'package:ztask/features/categories/domain/entities/category_entity.dart';
import 'package:ztask/features/merchant/domain/entities/merchant_entity.dart';

abstract class CategoriesRepository {
  Future<Either<Failure, APIResponse<List<CategoryEntity>>>> getPopularCategories();
  Future<Either<Failure, APIResponse<List<CategoryEntity>>>> getAllCategories();
  Future<Either<Failure, APIResponse<List<MerchantEntity>>>> getCategoryMerchants(int categoryId);
}
