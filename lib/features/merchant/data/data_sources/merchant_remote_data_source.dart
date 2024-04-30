import 'package:ztask/core/network/model/api_response.dart';
import 'package:ztask/features/merchant/data/models/merchant_model.dart';

///[Implementation]
abstract class MerchantRemoteDataSource {
  Future<APIResponse<MerchantModel>> getMerchantDetails(int id);
}
