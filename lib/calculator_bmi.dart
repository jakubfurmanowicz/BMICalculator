class CalculateBMI {
//  double? result;
//  String? error;
//  double? calculateYourBmi(
//      double enteredHeight, double enteredWeight) {
//    if (enteredHeight != null && enteredWeight != null) {
//      double height = enteredHeight / 100;
//      double weight = enteredWeight;
//       result = weight / (height * height);
//       return result;
//    } else {
//      error = 'Pola nie mogą być puste';
//    }
//  }

  double? _height = 0;

  double? _weight = 0;

  double _result = 0;

  String _group = 'Normal';

  void calculateYourBmi(String enteredHigh, String enteredWeight,
      int enteredAge, String personChoosen) {
    if (enteredHigh.isNotEmpty && enteredWeight.isNotEmpty) {
      double? parsedHeight = double.tryParse(enteredHigh);
      double? parsedWeight = double.tryParse(enteredWeight);

      if (parsedHeight != null && parsedWeight != null) {
        _height = parsedHeight / 100;
        _weight = parsedWeight;
        _result = _weight! / (_height! * _height!);

        if (enteredAge >= 18 && enteredAge <= 24) {
          if (_result >= 19 && _result <= 24) {
            _group = 'You have Normal body weight!';
          } else if (_result > 24) {
            _group = 'You have Overweight body weight!';
          } else if (_result < 19) {
            _group = 'You have Underweight body weight!';
          }
        } else if (enteredAge >= 25 && enteredAge <= 34) {
          if (_result >= 20 && _result <= 25) {
            _group = 'You have Normal body weight!';
          } else if (_result > 25) {
            _group = 'You have Overweight body weight!';
          } else if (_result < 20) {
            _group = 'You have Underweight body weight!';
          }
        } else if (enteredAge >= 35 && enteredAge <= 44) {
          if (_result >= 21 && _result <= 26) {
            _group = 'You have Normal body weight!';
          } else if (_result > 26) {
            _group = 'You have Overweight body weight!';
          } else if (_result < 21) {
            _group = 'You have Underweight body weight!';
          }
        } else if (enteredAge >= 45 && enteredAge <= 54) {
          if (_result >= 22 && _result <= 27) {
            _group = 'You have Normal body weight!';
          } else if (_result > 27) {
            _group = 'You have Overweight body weight!';
          } else if (_result < 22) {
            _group = 'You have Underweight body weight!';
          }
        } else if (enteredAge >= 55 && enteredAge <= 64) {
          if (_result >= 23 && _result <= 28) {
            _group = 'You have Normal body weight!';
          } else if (_result > 28) {
            _group = 'You have Overweight body weight!';
          } else if (_result < 23) {
            _group = 'You have Underweight body weight!';
          }
        } else if (enteredAge >= 65) {
          if (_result >= 24 && _result <= 29) {
            _group = 'You have Normal body weight!';
          } else if (_result > 29) {
            _group = 'You have Overweight body weight!';
          } else if (_result < 24) {
            _group = 'You have Underweight body weight!';
          }
        }
      } else {
        _result = 0;
        _group = "Field can't be empty, or equal zero";
      }
    } else {
      _result = 0;
      _group = "Field can't be empty, or equal zero";
    }
  }

  String get group => _group;

  double get result => _result;

}
