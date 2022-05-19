class ShowResult {
  double? bmiResult;

  String? showBmi(double enteredResult, int enteredAge) {
    bmiResult = enteredResult;
    print(bmiResult);
    // return bmiResult?.toStringAsFixed(2);
  }
}
