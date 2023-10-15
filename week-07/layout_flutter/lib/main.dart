import 'package:flutter/material.dart';
import 'package:layout_flutter/all_widget.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Andi Dwi Prastyo - 2141720046',
      // routes: {
      //   '/hal1': (context) => const Hal2(),
      // },
      home: All(),
    );
  }
}
