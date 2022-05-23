class ShowResult {
  double? bmiResult;

  String? showBmi(double enteredResult, int enteredAge) {
    bmiResult = enteredResult;
    return null;
    // return bmiResult?.toStringAsFixed(2);
  }
}
