import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String? name;
  String? surname;
  String? password;
  String? state;
  String? birth;
  String? description;

  void getData(String name, String surname, String password, String state,
      String birth, String description) {
    this.name = name;
    this.surname = surname;
    this.birth = birth;
    this.password = password;
    this.state = state;
    this.description = description;
  }

  @override
  Widget build(BuildContext context) {
    // c'era una volta una principessa di nome nicola
    //era molto bella e aveva un pisellone gigante
    //scriveva tutto in flutter e le sue app erano le migliori del mondo
    return Scaffold(
      body: Container(
        height: double.infinity,
        child: Text(
          name.toString(),
        ),
      ),
    );
  }
}
