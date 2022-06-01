import 'package:bmi_calculator/calculate_show_result.dart';

class CalculateBMI {
  Result calculateYourBmi(String enteredHigh, String enteredWeight, int enteredAge) {
    if (enteredHigh.isNotEmpty && enteredWeight.isNotEmpty) {
      double? parsedHeight = double.tryParse(enteredHigh);
      double? parsedWeight = double.tryParse(enteredWeight);
      if (parsedHeight != null && parsedWeight != null) {
        parsedHeight = parsedHeight / 100;
        final _result = parsedWeight / (parsedHeight * parsedHeight);
        String _group = '';
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
        return Result(_group, _result);
      } else {
        return Result("Field can't be empty, or equal zero", 0);

      }
    } else {
      return Result("Field can't be empty, or equal zero", 0);
    }
  }
}
