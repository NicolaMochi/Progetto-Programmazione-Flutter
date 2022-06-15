import 'package:flutter/material.dart';
import '../LoginPage.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

getUser() async {}

class _HomePageState extends State<HomePage> {
  final user = FirebaseAuth.instance.currentUser!;

  // se non esiste prova ad usare una stringa vuota

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Signed in as: ' + user.email!),
              MaterialButton(
                onPressed: () => FirebaseAuth.instance.signOut(),
                color: Colors.orangeAccent[200],
                child: Text('Sign out'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/*
body: Center(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Signed in as: ' + user.email!),
              MaterialButton(
                onPressed: () {
                  FirebaseAuth.instance.signOut();
                },
                color: Colors.orangeAccent[200],
                child: Text('Sign out'),
              )
            ],
          ),
        ),
      ),*/