import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Accepted extends StatefulWidget {
  const Accepted({Key? key}) : super(key: key);

  @override
  State<Accepted> createState() => _AcceptedState();
}

class _AcceptedState extends State<Accepted> {
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
