import 'package:eitherx/eitherx.dart';
import 'package:injectable/injectable.dart';
import 'package:ztask/core/error/failure.dart';
import 'package:ztask/core/network/model/api_response.dart';
import 'package:ztask/core/usecases/usecases.dart';
import 'package:ztask/features/categories/domain/entities/category_entity.dart';
import 'package:ztask/features/merchant/domain/entities/merchant_entity.dart';
import 'package:ztask/features/merchant/domain/entities/merchant_entity.dart';
import 'package:ztask/features/categories/domain/repositories/categories_repository.dart';

///[GetCategoryMerchantsUseCase]

@injectable
class GetCategoryMerchantsUseCase implements BaseUseCases<APIResponse<List<MerchantEntity>>, int> {
  final CategoriesRepository repository;

  const GetCategoryMerchantsUseCase(
      this.repository,
      );

  @override
  Future<Either<Failure, APIResponse<List<MerchantEntity>>>> call(int categoryId) async {
    return await repository.getCategoryMerchants(categoryId);
  }
}
