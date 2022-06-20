import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:vibe_flutter/auth/auth_page.dart';
import 'package:vibe_flutter/navbar/NavBar.dart';

import 'package:vibe_flutter/pages/home_page.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            // se lo user c e allora ok e vai in homepage
            return NavBar();
          } else {
            return AuthPage(); // dalla auth page sara o loginpage o register page
          }
        },
      ),
    );
  }
}
