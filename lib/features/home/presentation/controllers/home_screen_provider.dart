import 'package:flutter/cupertino.dart';

class HomeScreenProvider with ChangeNotifier {
  DateTime selectedDate = DateTime.now();
  bool isCalenderSelected = true;

  setSelectedDate(DateTime selectedDate) {
    this.selectedDate = selectedDate;
    notifyListeners();
  }

  changeListState(bool val) {
    isCalenderSelected = val;
    notifyListeners();
  }
}
