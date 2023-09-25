import 'package:flutter/material.dart';

class MyImageWidget extends StatelessWidget {
  const MyImageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TRY THIS: Try changing the value of the "fit" property below to
    // BoxFit.contain, BoxFit.cover, BoxFit.fill, BoxFit.fitHeight, or
    // BoxFit.fitWidth. What do you notice about the image?
    return const Image( 
      image: AssetImage('assets/logo_polinema.jpeg'),
    );
  }
}