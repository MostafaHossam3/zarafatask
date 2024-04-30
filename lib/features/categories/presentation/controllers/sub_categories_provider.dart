import 'package:flutter/cupertino.dart';
import 'package:ztask/features/categories/domain/entities/category_entity.dart';
import 'package:ztask/features/categories/domain/entities/category_entity.dart';
import 'package:ztask/features/merchant/domain/entities/merchant_entity.dart';
import 'package:ztask/features/categories/domain/use_cases/get_all_categories.dart';
import 'package:ztask/features/categories/domain/use_cases/get_category_merchants.dart';
import 'package:ztask/features/categories/domain/use_cases/get_popular_categories.dart';
import 'package:ztask/src/dependency_injection/dependency_injection.dart';

class SubCategoriesProvider with ChangeNotifier {
  bool isLoadingMerchants = true;
  bool showSearchResults = false;
  List<MerchantEntity> originalMerchants = [];
  List<MerchantEntity> merchants = [];
  int selectedCategoryIndex = 0;

  SubCategoriesProvider() {
    initializeMerchants();
  }

  initializeMerchants() async {
    isLoadingMerchants = true;
    notifyListeners();
    var res = await getIt<GetCategoryMerchantsUseCase>().call(1);
    res.fold((l) {}, (r) {
      originalMerchants = r.data!;
      merchants = r.data!;
    });
    isLoadingMerchants = false;
    notifyListeners();
  }

  setSortingCase(String text) {
    showSearchResults = text.toLowerCase() != 'all';
    merchants = [...originalMerchants];
    if (showSearchResults) {
      merchants.removeWhere((merchant) => !merchant.title.toLowerCase().startsWith(text.toLowerCase()));
    }
    notifyListeners();
  }

  setSelectedCategoryIndex(int index) {
    selectedCategoryIndex = index;
    notifyListeners();
    initializeMerchants();
  }
}
