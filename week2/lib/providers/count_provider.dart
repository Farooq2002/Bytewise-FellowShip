import 'package:flutter/cupertino.dart';

class CountProvider extends ChangeNotifier {
  int _count = 0;

  int get count => _count;

  void setCount() {
    _count++;
    notifyListeners();
  }
}
