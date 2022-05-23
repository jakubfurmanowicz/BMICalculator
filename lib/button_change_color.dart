class ChangeButtonColor {
  int firstColor = 0xff59d995;
  int secondColor = 0;
  String whichPersonIsChoose = 'male';

  void firstButtonPressed() {
    firstColor = 0xff59d995;
    secondColor = 0xff171616;
    whichPersonIsChoose = 'male';
  }

  void secondButtonPressed() {
    firstColor = 0xff171616;
    secondColor = 0xff59d995;
    whichPersonIsChoose = 'female';
  }
}
