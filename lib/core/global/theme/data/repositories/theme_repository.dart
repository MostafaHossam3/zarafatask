// import 'package:ecom/core/error/failure.dart';
// import 'package:ecom/core/global/theme/data/datasource/theme_datasource.dart';
// import 'package:ecom/core/global/theme/domain/repositories/base_theme_repository.dart';
// import 'package:eitherx/eitherx.dart';
// import 'package:injectable/injectable.dart';
// import 'package:ztask/core/error/failure.dart';
//
// @Injectable(as: BaseThemeRepository)
// class ThemeRepository extends BaseThemeRepository {
//   BaseThemeDataSource baseThemeDataSource;
//   ThemeRepository({required this.baseThemeDataSource});
//
//   @override
//   Future<Either<Failure, void>> changeTheme({required int themeIndex}) async {
//     try {
//       return Right(await baseThemeDataSource.changeTheme(themeIndex: themeIndex));
//     } on FailureException catch (ex) {
//       return Left(CacheFailure(messages: ex.messages));
//     }
//   }
// }
