void main() {
  // Step 1

  var list = [1, 2, 3];
  assert(list.length == 3);
  assert(list[1] == 2);
  print(list.length);
  print(list[1]);

  list[1] = 1;
  assert(list[1] == 1);
  print(list[1]);

  // Step 3
  final List<String?> list_nim = List.filled(6, null);
  list_nim[1] = 'Nama: Andi Dwi Prastyo, NIM:2141720046';
  list_nim[2] = 'Nama: Bagus Rezky Adhyaksa, NIM:2141720210';

  print(list_nim);
}
