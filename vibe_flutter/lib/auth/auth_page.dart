import 'package:flutter/material.dart';
import 'package:vibe_flutter/pages/LoginPage.dart';

import 'package:vibe_flutter/pages/Reg.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  // mostra login page all inizio

  bool showLoginPage = true;

  void toggleScreens() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

// gestion toggle, per il tocco sotto login button e registration button
  @override
  Widget build(BuildContext context) {
    if (showLoginPage) {
      return LoginPage(showRegisterPage: toggleScreens);
    } else {
      return Register(
          showLoginPage:
              toggleScreens); // cliccando sul tasto registra va nella pagina registra
    }
  }
}
