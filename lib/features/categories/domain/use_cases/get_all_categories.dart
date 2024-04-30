import 'package:eitherx/eitherx.dart';
import 'package:injectable/injectable.dart';
import 'package:ztask/core/error/failure.dart';
import 'package:ztask/core/network/model/api_response.dart';
import 'package:ztask/core/usecases/usecases.dart';
import 'package:ztask/features/categories/domain/entities/category_entity.dart';
import 'package:ztask/features/categories/domain/repositories/categories_repository.dart';

///[GetAllCategoriesUseCase]

@injectable
class GetAllCategoriesUseCase implements BaseUseCasesNoParam<APIResponse<List<CategoryEntity>?>> {
  final CategoriesRepository repository;

  const GetAllCategoriesUseCase(
    this.repository,
  );

  @override
  Future<Either<Failure, APIResponse<List<CategoryEntity>?>>> call() async {
    return await repository.getAllCategories();
  }
}
