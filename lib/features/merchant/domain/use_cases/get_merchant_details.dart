
import 'package:eitherx/eitherx.dart';
import 'package:injectable/injectable.dart';
import 'package:ztask/core/error/failure.dart';
import 'package:ztask/core/network/model/api_response.dart';
import 'package:ztask/core/usecases/usecases.dart';
import 'package:ztask/features/merchant/domain/entities/merchant_entity.dart';
import 'package:ztask/features/merchant/domain/repositories/merchant_repository.dart';

///[GetMerchantDetailsUseCase]

@injectable
class GetMerchantDetailsUseCase
    implements BaseUseCases<APIResponse<MerchantEntity>, int> {
  final MerchantRepository repository;

  const GetMerchantDetailsUseCase(
      this.repository,
      );

  @override
  Future<Either<Failure, APIResponse<MerchantEntity>>> call(int id) async {
    return await repository.getMerchantDetails(id);
  }
}
