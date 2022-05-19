class CalculateBMI {
  double? result;
  double? calculateYourBmi(
      double enteredHeight, double enteredWeight) {
    if (enteredHeight != null && enteredWeight != null) {
      double height = enteredHeight / 100;
      double weight = enteredWeight;
       result = weight / (height * height);

       return result;

    }



  }

//double? _height;
//
//double? _weight;
//
//double _result = 0;
//
//String _group = '';
//
//String _error = '';
//
//void calculateYourBmi(
//    String enteredHigh, String enteredWeight, int enteredAge) {
//  if (enteredHigh.isNotEmpty && enteredWeight.isNotEmpty) {
//    double? parsedHeight = double.tryParse(enteredHigh);
//    double? parsedWeight = double.tryParse(enteredWeight);
//
//    if (parsedHeight != null && parsedWeight != null) {
//      _height = parsedHeight / 100;
//      _weight = parsedWeight;
//      _result = _weight! / (_height! * _height!);
//      _error = '';
//
//      if (enteredAge >= 18 && enteredAge <= 24) {
//        if (_result >= 19 && _result <= 24) {
//          _group = 'waga prawidłowa';
//          _error = '';
//        } else if (_result > 24) {
//          _group = 'nadwaga';
//          _error = '';
//        } else if (_result < 19) {
//          _group = 'niedowaga';
//          _error = '';
//        }
//      } else if (enteredAge >= 25 && enteredAge <= 34) {
//        if (_result >= 20 && _result <= 25) {
//          _group = 'waga prawidłowa';
//          _error = '';
//        } else if (_result > 25) {
//          _group = 'nadwaga';
//          _error = '';
//        } else if (_result < 20) {
//          _group = 'niedowaga';
//          _error = '';
//        }
//      } else if (enteredAge >= 35 && enteredAge <= 44) {
//        if (_result >= 21 && _result <= 26) {
//          _group = 'waga prawidłowa';
//          _error = '';
//        } else if (_result > 26) {
//          _group = 'nadwaga';
//          _error = '';
//        } else if (_result < 21) {
//          _group = 'niedowaga';
//          _error = '';
//        }
//      } else if (enteredAge >= 45 && enteredAge <= 54) {
//        if (_result >= 22 && _result <= 27) {
//          _group = 'waga prawidłowa';
//          _error = '';
//        } else if (_result > 27) {
//          _group = 'nadwaga';
//          _error = '';
//        } else if (_result < 22) {
//          _group = 'niedowaga';
//          _error = '';
//        }
//      } else if (enteredAge >= 55 && enteredAge <= 64) {
//        if (_result >= 23 && _result <= 28) {
//          _group = 'waga prawidłowa';
//          _error = '';
//        } else if (_result > 28) {
//          _group = 'nadwaga';
//          _error = '';
//        } else if (_result < 23) {
//          _group = 'niedowaga';
//          _error = '';
//        }
//      } else if (enteredAge >= 65) {
//        if (_result >= 24 && _result <= 29) {
//          _group = 'waga prawidłowa';
//          _error = '';
//        } else if (_result > 29) {
//          _group = 'nadwaga';
//          _error = '';
//        } else if (_result < 24) {
//          _group = 'niedowaga';
//          _error = '';
//        }
//      }
//    } else {
//      _error = 'Pole nie może być puste';
//      _result = 0;
//    }
//  } else {
//    _error = 'Pole nie może być puste';
//    _result = 0;
//  }
//}
//
//String get group => _group;
//
//double get result => _result;
//
//String get error => _error;
}
