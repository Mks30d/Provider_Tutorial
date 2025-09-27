import 'package:flutter/cupertino.dart';

class ListMapProvider extends ChangeNotifier {
  List<Map<String, dynamic>> _listData = [];

  // getter
  List<Map<String, dynamic>> getListData() {
    return _listData;
  }

  // event
  void addData(Map<String, dynamic> data) {
    _listData.add(data);
    notifyListeners();
  }
}
