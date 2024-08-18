import 'package:flutter/cupertino.dart';

class HomeScreenProvider with ChangeNotifier {
  DateTime selectedDate = DateTime.now();
  bool isCalenderSelected = true;
  bool isLoading = true;

  HomeScreenProvider() {
    getData();
  }

  setSelectedDate(DateTime selectedDate) {
    this.selectedDate = selectedDate;
    notifyListeners();
    getData();
  }

  changeListState(bool val) {
    isCalenderSelected = val;
    notifyListeners();
    getData();
  }

  getData() async {
    isLoading = true;
    notifyListeners();
    await Future.delayed(Duration(seconds: 1));
    isLoading = false;
    notifyListeners();
  }
}
