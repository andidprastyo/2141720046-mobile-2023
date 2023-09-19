# Week 04 - Collections, Records, & Functions

**Nama :** Andi Dwi Prastyo<br>
**NIM :** 2141720046<br>
**Kelas :** TI-3H<br>
**Absen :** 06

## Tugas Nomer 1

### Praktikum 1

Fungsi `assert` digunakan untuk memastikan bahwa nilai yang diharapkan sama dengan nilai yang dihasilkan oleh program. Kemudian karena nilainya true program akan menampilkan panjang dari data yang ada di `list` kemudian akan menampilkan data di index 1 pada di `list` tersebut.

![image](./docs/img/p1.png)

Kemudian membuat list bertipe final yang nantinya akan diisi dengan nama dan NIM.

### Praktikum 2

Terdapat dua cara untuk menginisialisasi `set` yaitu : 

``` 
  var names1 = <String>{};
  Set<String> names2 = {};
```

![image](./docs/img/p2.png)

Kemudian untuk menambahkan nilai pada `set` dapat menggunakan fungsi `add` atau `addAll`.

### Praktikum 3

`Map` adalah kumpulan pasangan nilai kunci yang unik. Untuk menginisialisasi `map` dapat menggunakan cara berikut :

```
  var gifts = {
	// Key:    Value
	'first': 'partridge',
	'second': 'turtledoves',
	'fifth': 'golden rings'
  };
```

![image](./docs/img/p3.png)

Kemudian untuk menambahkan nilai pada `map` dapat menggunakan fungsi `addEntries` atau `addAll`.

### Praktikum 4

Spread operator `...` digunakan untuk mengeluarkan nilai dari `list` atau `map` dan menambahkan ke `list` atau `map` yang baru. Di sini kita menambahkan NIM ke list 1 menggunakan spread operator.

![image](./docs/img/p4.png)

Kemudian, Control Flow operators digunakan untuk mengecek apakah nilai yang diharapkan sama dengan nilai yang dihasilkan oleh program. Jika nilai yang diharapkan sama dengan nilai yang dihasilkan oleh program maka program akan menampilkan nilai tersebut.

Kita bisa menggunakan `if` dan `else` untuk mengecek nilai yang diharapkan sama dengan nilai yang dihasilkan oleh program.

### Praktikum 5

Records merupakan struktur data yang digunakan untuk menyimpan informasi yang terdiri dari beberapa field. Untuk membuat records dapat menggunakan cara berikut :

```
(int, int) tukar((int, int) record) {
  var (a, b) = record;
  return (b, a);
}
```
Kemudian memanggil fungsi tersebut di `Main()` dan mengisi nilai yang akan ditukar.

![image](./docs/img/p5.png)

## Tugas Nomer 2

Functions dalam dart adalah sebuah blok kode yang akan dijalankan ketika dipanggil. Function dapat digunakan untuk mengelompokkan kode sehingga lebih mudah dibaca dan digunakan kembali.

## Tugas Nomer 3

### Named Parameter 

Dapat menjadi required atau opsional

```dart
void enableFlags({bool? bold, bool? hidden}) {
  print('Bold: $bold');
  print('Hidden: $hidden');
}

void main() {
  // Memanggil fungsi dengan menggunakan named parameters
  enableFlags(bold: true, hidden: false);
}
```

### Optional Positional Parameter

Optional positional parameter dalam pemrograman adalah parameter fungsi yang dapat diabaikan saat pemanggilan fungsi dan diidentifikasi berdasarkan posisi argument yang diberikan, memungkinkan fleksibilitas dalam memberikan argumen sesuai kebutuhan.

```dart
void printDetails(String name, [int age, String country]) {
  print('Name: $name');
  if (age != null) {
    print('Age: $age');
  }
  if (country != null) {
    print('Country: $country');
  }
}

void main() {
  // Memanggil fungsi dengan argument sesuai posisi
  printDetails('John');
  printDetails('Jane', 30);
  printDetails('Doe', 25, 'USA');
}
```

## Tugas Nomer 4

First-class dianggap sebagai entitas yang dapat diperlakukan dengan cara yang sama seperti entitas lain dalam bahasa pemrograman, sehingga memungkinkan kita untuk memperlakukan fungsi seperti variabel, seperti menggunakan fungsi sebagai argumen untuk parameter ketika memanggil fungsi.

```dart

int add(int x, int y) {
  return x + y;
}

int launchOperation(Function operation, int x, int y) {
  return operation(x, y);
}

void main(){
int hasil = launchOperation(tambah, 5, 3);

print(hasil);  // Output: 8
}
```

## Tugas Nomer 5

Fungsi anonim dalam Dart adalah fungsi yang tidak memiliki nama dan dapat didefinisikan dan digunakan tanpa perlu mendeklarasikan namanya.

 ```dart  
 void launchOperation(int x, int y, Function operate) {
  int result = operate(x, y);
  print("Result: $result");
}

void main() {
  
  launchOperation(5, 3, (a, b) {
    return a + b;
  });
}
 ```

## Tugas Nomer 6

Lexical scope adalah konsep di mana akses ke variabel dalam suatu fungsi ditentukan oleh struktur penulisan kode pada waktu kompilasi, sementara lexical closures adalah kemampuan sebuah fungsi untuk "mengingat" lingkungan (variabel lokal, parameter, dan fungsi lain) di sekitarnya bahkan setelah fungsi tersebut selesai dieksekusi.

```dart
// Contoh Lexical Scope

void main() {
  int x = 10;

  void printValue() {
    print(x); // Memiliki akses ke variabel x karena berada dalam lexical scope
  }

  printValue(); // Memanggil fungsi printValue
}

```

```dart
// Contoh Lexical Closure

Function createAdder(int x) {
  return (int y) => x + y; // Menciptakan closure yang mengingat nilai x
}

void main() {
  int base = 5;
  var adder = createAdder(base);
  
  print(adder(10)); // Output: 15 (base + 10)
}

```

## Tugas Nomer 7

Anda dapat mengembalikan multiple values menggunakan tipe data seperti List, Map, atau custom class. 

```dart
// Menggunakan List

List<int> calculate(int a, int b) {
  int sum = a + b;
  int difference = a - b;
  return [sum, difference];
}

void main() {
  List<int> result = calculate(10, 5);
  print('Sum: ${result[0]}, Difference: ${result[1]}');
}
```

```dart
// Menggunakan Map

Map<String, int> calculate(int a, int b) {
  int sum = a + b;
  int difference = a - b;
  return {'sum': sum, 'difference': difference};
}

void main() {
  Map<String, int> result = calculate(10, 5);
  print('Sum: ${result['sum']}, Difference: ${result['difference']}');
}
```

```dart
// Menggunakan Custom Classs

class CalculationResult {
  int sum;
  int difference;

  CalculationResult(this.sum, this.difference);
}

CalculationResult calculate(int a, int b) {
  int sum = a + b;
  int difference = a - b;
  return CalculationResult(sum, difference);
}

void main() {
  CalculationResult result = calculate(10, 5);
  print('Sum: ${result.sum}, Difference: ${result.difference}');
}

```