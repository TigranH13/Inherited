import 'package:flutter/material.dart';

class CalcModel extends ChangeNotifier {
  int? _firstNumber;

  int? _secondNumber;
  int? sumResult;

  set firstNumber(String value) => _firstNumber = int.parse(value);

  set secondNumber(String value) => _secondNumber = int.parse(value);

  void summm() {
    int? sumResult;
    if (_firstNumber != null && _secondNumber != null) {
      sumResult = _firstNumber! + _secondNumber!;
    } else {
      sumResult = null;
    }
    if (this.sumResult != sumResult) {
      this.sumResult = sumResult;
      notifyListeners();
    }
  }
}
