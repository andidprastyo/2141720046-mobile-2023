void main() {
  // // Step 1 - List

  // var list = [1, 2, 3];
  // assert(list.length == 3);
  // assert(list[1] == 2);
  // print(list.length);
  // print(list[1]);

  // list[1] = 1;
  // assert(list[1] == 1);
  // print(list[1]);

  // // Step 3
  // final List<String?> list_nim = List.filled(6, null);
  // list_nim[1] = 'Nama: Andi Dwi Prastyo, NIM:2141720046';
  // list_nim[2] = 'Nama: Bagus Rezky Adhyaksa, NIM:2141720210';

  // print(list_nim);

  // Praktikum 2 - Set

  // // Step 1

  // var halogens = {'fluorine', 'chlorine', 'bromine', 'iodine', 'astatine'};
  // print(halogens);

  // // Step 3

  // var names1 = <String>{};
  // Set<String> names2 = {};

  // names1.add('Nama: Andi Dwi Prastyo, NIM:2141720046');
  // names2.addAll(['Nama: Bagus Rezky Adhyaksa, NIM:2141720210']);

  // print(names1);
  // print(names2);

  // Praktikum 3 - Map

  // Step 1

  var gifts = {
    // Key:    Value
    'first': 'partridge',
    'second': 'turtledoves',
    'fifth': 1
  };

  var nobleGasses = {2: 'helium', 10: 'neon', 18: 2};

  print(gifts);
  print(nobleGasses);

  // Step 3

  var mhs1 = Map<String, String>();
  mhs1['name'] = 'Andi DWi Prastyo';
  mhs1['nim'] = '2141720046';

  var mhs2 = Map<int, String>();
  mhs2[1] = 'Bagus Rezky Adhyaksa';
  mhs2[2] = '2141720210';

  mhs1.addAll({'fifth': 'golden rings'});
  mhs2.addAll({18: 'argon'});

  print(mhs1);
  print(mhs2);
}
