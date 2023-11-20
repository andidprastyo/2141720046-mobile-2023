import 'package:flutter/material.dart';

class ColorSteam {
  final List<Color> colors = [
    Colors.blueGrey,
    Colors.amber,
    Colors.deepPurple,
    Colors.lightBlue,
    Colors.teal,
    Colors.black,
    Colors.red,
    Colors.green,
    Colors.pink,
    Colors.purple,
  ];

  Stream<Color> get stream async* {
    yield* Stream.periodic(
      const Duration(seconds: 1), (int t){
        int index = t % colors.length;
        return colors[index];
      }
    );
  }

}
