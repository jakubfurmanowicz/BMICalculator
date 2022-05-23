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
    if (age == 17) {
      age = 17;
    } else {
      age--;
      return age;
    }
    return null;
  }
}
