void main() {
  // Older version of Null Safety will results in Error, example:
  // int newAngka = null;
  // print(newAngka);

  // We can utilize the ? declaration to set a null value, example:
  int? newAngka;
  print(newAngka);

  newAngka = 69;
  print(newAngka);

  // We can also use the late variables to set a null value, example:
  late int lateAngka;
  lateAngka = 420;

  print(lateAngka);
}
