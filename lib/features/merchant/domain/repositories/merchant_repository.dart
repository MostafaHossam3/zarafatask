import 'package:eitherx/eitherx.dart';
import 'package:ztask/core/error/failure.dart';
import 'package:ztask/core/network/model/api_response.dart';
import 'package:ztask/features/merchant/domain/entities/merchant_entity.dart';

abstract class MerchantRepository {
  Future<Either<Failure, APIResponse<MerchantEntity>>> getMerchantDetails(int id);
}
