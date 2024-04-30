import 'package:eitherx/eitherx.dart';
import 'package:injectable/injectable.dart';
import 'package:ztask/core/error/exceptions.dart';
import 'package:ztask/core/error/failure.dart';
import 'package:ztask/core/network/model/api_response.dart';
import 'package:ztask/features/categories/data/data_sources/categories_remote_data_source.dart';
import 'package:ztask/features/categories/domain/entities/category_entity.dart';
import 'package:ztask/features/merchant/domain/entities/merchant_entity.dart';
import 'package:ztask/features/categories/domain/repositories/categories_repository.dart';

///[CategoriesRepositoryImplement]
///[Implementation]
@Injectable(as: CategoriesRepository)
class CategoriesRepositoryImplement implements CategoriesRepository {
  final CategoriesRemoteDataSource categoriesRemoteDataSource;

  const CategoriesRepositoryImplement(
    this.categoriesRemoteDataSource,
  );

  @override
  Future<Either<Failure, APIResponse<List<CategoryEntity>>>> getPopularCategories() async {
    try {
      return Right(await categoriesRemoteDataSource.getPopularCategories());
    } on ServerException catch (ex) {
      /// This will only be used in case of crashlytics reporter
      // AppCrashReporter.recordError(
      //   ex.message,
      //   exception: ex,
      //   stack: s,
      //   className: "CategoriesRepositoryImplement",
      //   functionName: "getPopularCategories",
      // );
      return Left(ServerFailure(messages: ex.messages));
    }
  }

  @override
  Future<Either<Failure, APIResponse<List<CategoryEntity>>>> getAllCategories() async {
    try {
      return Right(await categoriesRemoteDataSource.getAllCategories());
    } on ServerException catch (ex) {
      /// This will only be used in case of crashlytics reporter
      // AppCrashReporter.recordError(
      //   ex.message,
      //   exception: ex,
      //   stack: s,
      //   className: "CategoriesRepositoryImplement",
      //   functionName: "getAllCategories",
      // );
      return Left(ServerFailure(messages: ex.messages));
    }
  }

  @override
  Future<Either<Failure, APIResponse<List<MerchantEntity>>>> getCategoryMerchants(int categoryId) async {
    try {
      return Right(await categoriesRemoteDataSource.getCategoryMerchants(categoryId));
    } on ServerException catch (ex) {
      /// This will only be used in case of crashlytics reporter
      // AppCrashReporter.recordError(
      //   ex.message,
      //   exception: ex,
      //   stack: s,
      //   className: "CategoriesRepositoryImplement",
      //   functionName: "getCategoryMerchants",
      // );
      return Left(ServerFailure(messages: ex.messages));
    }
  }
}
