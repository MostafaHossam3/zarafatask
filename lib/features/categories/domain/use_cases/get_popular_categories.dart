
import 'package:eitherx/eitherx.dart';
import 'package:injectable/injectable.dart';
import 'package:ztask/core/error/failure.dart';
import 'package:ztask/core/network/model/api_response.dart';
import 'package:ztask/core/usecases/usecases.dart';
import 'package:ztask/features/categories/domain/entities/category_entity.dart';
import 'package:ztask/features/categories/domain/repositories/categories_repository.dart';

///[GetPopularCategoriesUseCase]

@injectable
class GetPopularCategoriesUseCase
    implements BaseUseCasesNoParam<APIResponse<List<CategoryEntity>>> {
  final CategoriesRepository repository;

  const GetPopularCategoriesUseCase(
      this.repository,
      );

  @override
  Future<Either<Failure, APIResponse<List<CategoryEntity>>>> call() async {
    return await repository.getPopularCategories();
  }
}
