import 'package:flutter/material.dart';

class AppState extends ChangeNotifier {
  Map<String, dynamic>? user;
  List<String> items = [];

  void addItem(String item) {
    items.add(item);
    notifyListeners();
  }

  void setUser(Map<String, dynamic> user) {
    this.user = user;
    notifyListeners();
  }
}
