import 'package:flutter/foundation.dart';

class HomeMenuLabelController extends ChangeNotifier {

  String label = "";
  bool isExpanded = false;

  void setLabel(String label) {
    this.label = label;
    notifyListeners();
  }

  void expand() {
    notifyListeners();
    isExpanded = true;
  }

  void collapse() {
    notifyListeners();
    isExpanded = false;
  }
}