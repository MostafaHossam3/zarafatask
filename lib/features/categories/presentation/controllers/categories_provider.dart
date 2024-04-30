import 'package:flutter/cupertino.dart';
import 'package:ztask/features/categories/domain/entities/category_entity.dart';
import 'package:ztask/features/categories/domain/entities/category_entity.dart';
import 'package:ztask/features/categories/domain/use_cases/get_all_categories.dart';
import 'package:ztask/features/categories/domain/use_cases/get_popular_categories.dart';
import 'package:ztask/src/dependency_injection/dependency_injection.dart';

class CategoriesProvider with ChangeNotifier {
  bool isLoadingPopularCategories = true;
  bool isLoadingAllCategories = true;
  List<CategoryEntity> originalPopularCategories = [];
  List<CategoryEntity> originalAllCategories = [];

  bool showSearchResults = false;
  final TextEditingController searchController = TextEditingController();
  List<CategoryEntity> popularCategories = [];
  List<CategoryEntity> allCategories = [];

  CategoriesProvider() {
    initializeCategories();
  }

  initializeCategories() {
    initializePopularCategories();
    initializeAllCategories();
  }

  initializePopularCategories() async {
    var res = await getIt<GetPopularCategoriesUseCase>().call();
    res.fold((l) {}, (r) {
      originalPopularCategories = r.data!;
      popularCategories = r.data!;
    });
    isLoadingPopularCategories = false;
    notifyListeners();
  }

  initializeAllCategories() async {
    var res = await getIt<GetAllCategoriesUseCase>().call();
    res.fold((l) {}, (r) {
      originalAllCategories = r.data!;
      allCategories = r.data!;
    });
    isLoadingAllCategories = false;
    notifyListeners();
  }

  onSearchTextChange(String text) {
    showSearchResults = text.isNotEmpty;
    popularCategories = [...originalPopularCategories];
    allCategories = [...originalAllCategories];
    if (showSearchResults) {
      popularCategories.removeWhere((category) => !category.title.toLowerCase().contains(text.toLowerCase()));
      allCategories.removeWhere((category) => !category.title.toLowerCase().contains(text.toLowerCase()));
    }
    notifyListeners();
  }

}
