// import 'package:injectable/injectable.dart';
// import 'package:ztask/src/dependency_injection/dependency_injection.dart';
//
// abstract class BaseThemeDataSource {
//   Future<void> changeTheme({required int themeIndex});
// }
//
// @Injectable(as: BaseThemeDataSource)
// class ThemeDataSource implements BaseThemeDataSource {
//   @override
//   Future<void> changeTheme({required int themeIndex}) async {
//     await getIt<SharedPreferencesServices>().saveData(
//       key: AppConstance.storedThemeApp,
//       value: themeIndex,
//       dataType: DataType.int,
//     );
//   }
// }
