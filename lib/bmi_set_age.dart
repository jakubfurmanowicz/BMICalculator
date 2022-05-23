class SetYourAge {
  int age = 23;

  int? increaseAge() {
    if (age == 120) {
      age = 120;
    } else {
      age++;
      return age;
    }
    return null;
  }

  int? decreaseAge() {
    if (age == 18) {
      age = 18;
    } else {
      age--;
      return age;
    }
    return null;
  }
}
