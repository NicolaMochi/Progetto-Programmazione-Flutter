import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Add extends StatelessWidget {
  const Add({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Lottie.network(
            'https://assets5.lottiefiles.com/packages/lf20_z8szrftm.json'),
      ),
    );
  }
}
