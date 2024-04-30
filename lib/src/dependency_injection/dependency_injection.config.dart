// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../features/categories/data/data_sources/categories_remote_data_source.dart'
    as _i5;
import '../../features/categories/data/data_sources/categories_remote_data_source_impl.dart'
    as _i6;
import '../../features/categories/data/repositories/categories_repository_impl.dart'
    as _i10;
import '../../features/categories/domain/repositories/categories_repository.dart'
    as _i9;
import '../../features/categories/domain/use_cases/get_all_categories.dart'
    as _i11;
import '../../features/categories/domain/use_cases/get_category_merchants.dart'
    as _i12;
import '../../features/categories/domain/use_cases/get_popular_categories.dart'
    as _i13;
import '../../features/merchant/data/data_sources/merchant_remote_data_source.dart'
    as _i3;
import '../../features/merchant/data/data_sources/merchant_remote_data_source_impl.dart'
    as _i4;
import '../../features/merchant/data/repositories/merchant_repository_impl.dart'
    as _i8;
import '../../features/merchant/domain/repositories/merchant_repository.dart'
    as _i7;
import '../../features/merchant/domain/use_cases/get_merchant_details.dart'
    as _i14;

// initializes the registration of main-scope dependencies inside of GetIt
_i1.GetIt $initGetIt(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  gh.factory<_i3.MerchantRemoteDataSource>(
      () => _i4.MerchantRemoteDataSourceImplement());
  gh.factory<_i5.CategoriesRemoteDataSource>(
      () => _i6.CategoriesRemoteDataSourceImplement());
  gh.factory<_i7.MerchantRepository>(() =>
      _i8.MerchantRepositoryImplement(gh<_i3.MerchantRemoteDataSource>()));
  gh.factory<_i9.CategoriesRepository>(() =>
      _i10.CategoriesRepositoryImplement(gh<_i5.CategoriesRemoteDataSource>()));
  gh.factory<_i11.GetAllCategoriesUseCase>(
      () => _i11.GetAllCategoriesUseCase(gh<_i9.CategoriesRepository>()));
  gh.factory<_i12.GetCategoryMerchantsUseCase>(
      () => _i12.GetCategoryMerchantsUseCase(gh<_i9.CategoriesRepository>()));
  gh.factory<_i13.GetPopularCategoriesUseCase>(
      () => _i13.GetPopularCategoriesUseCase(gh<_i9.CategoriesRepository>()));
  gh.factory<_i14.GetMerchantDetailsUseCase>(
      () => _i14.GetMerchantDetailsUseCase(gh<_i7.MerchantRepository>()));
  return getIt;
}
