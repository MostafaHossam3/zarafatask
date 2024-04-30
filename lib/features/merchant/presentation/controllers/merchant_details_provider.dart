import 'package:flutter/cupertino.dart';
import 'package:ztask/features/merchant/domain/entities/merchant_entity.dart';
import 'package:ztask/features/merchant/domain/use_cases/get_merchant_details.dart';
import 'package:ztask/src/dependency_injection/dependency_injection.dart';

class MerchantDetailsProvider with ChangeNotifier {
  bool isLoading = true;
  MerchantEntity? merchantEntity;

  MerchantDetailsProvider() {
    initializeMerchantDetails();
  }

  initializeMerchantDetails() async {
    var res = await getIt<GetMerchantDetailsUseCase>().call(1);
    res.fold((l) {}, (r) {
      merchantEntity = r.data;
      notifyListeners();
    });
    isLoading = false;
    notifyListeners();
  }
}
