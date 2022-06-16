import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:vibe_flutter/pages/cerca_page.dart';
import 'package:vibe_flutter/pages/home_page.dart';
import 'package:vibe_flutter/pages/profile.dart';

class Accepted extends StatefulWidget {
  const Accepted({Key? key}) : super(key: key);

  @override
  State<Accepted> createState() => _AcceptedState();
}

class _AcceptedState extends State<Accepted> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Accepted page'),
    );
  }
}
