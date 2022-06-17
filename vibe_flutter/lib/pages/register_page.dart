import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class RegisterPage extends StatefulWidget {
  final VoidCallback showLoginPage;

  const RegisterPage({Key? key, required this.showLoginPage}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _nameController = TextEditingController();
  final _surnameController = TextEditingController();
  final _stateController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _dateController = TextEditingController();
  final _descriptionController = TextEditingController();

  final databaseRef = FirebaseDatabase.instance.ref();

  bool isPasswordVisible = true;
  var _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
    _surnameController.dispose();
    _stateController.dispose();
    _confirmPasswordController.dispose();
    _dateController.dispose();
    _descriptionController.dispose();

    super.dispose();
  }

  bool checkFields(String email, String password, String name, String surname,
      String confirmPassw, String date) {
    if (email.isEmpty) {
      return false;
    }

    if (password.isEmpty) {
      return false;
    }

    if (name.isEmpty) {
      return false;
    }

    if (surname.isEmpty) {
      return false;
    }

    if (confirmPassw.isEmpty) {
      return false;
    }

    if (date.isEmpty) {
      return false;
    } else {
      return true;
    }
    print("fine check");
  }

  late UserCredential usercred;

  Future signUp() async {
    var email = _emailController.text.trim();
    var password = _passwordController.text.trim();
    var name = _nameController.text.trim();
    var surname = _surnameController.text.trim();
    var confirmPassword = _confirmPasswordController.text.trim();
    var state = _stateController.text.trim();
    var birth = _dateController.text.trim();
    var description = _descriptionController.text.trim();

    var check =
        checkFields(name, surname, email, password, confirmPassword, birth);

    FirebaseAuth auth = FirebaseAuth.instance;
    //
    if (check && passwordConfirmed()) {
      try {
        usercred = await auth.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );

        // aggiungi dettagli utente
        addUserDetails(name, surname, password, state, birth, description);
      } on FirebaseAuthException catch (e) {
        print(e);
      }
    }
  }

  Future addUserDetails(String name, String surname, String password,
      String state, String birth, String description) async {
    String? uid = usercred.user?.uid;
    await databaseRef.child('Users').child(uid.toString()).set({
      'name': name,
      'surname': surname,
      'password': password,
      'state': state,
      'birth': birth,
      'description': description,
    });
  }

  bool passwordConfirmed() {
    if (_passwordController.text.trim() ==
        _confirmPasswordController.text.trim()) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amberAccent[300],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 20),
                Text(
                  'Registration',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 49,
                      color: Colors.orangeAccent),
                ),
                SizedBox(height: 100),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.orangeAccent[200],
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: TextField(
                        keyboardType: TextInputType.emailAddress,
                        controller: _emailController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Insert your email',
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 30),

                // name textfield
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.orangeAccent[200],
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: TextField(
                        controller: _nameController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Insert your name',
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 30),

                //surname
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.orangeAccent[200],
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: TextField(
                        controller: _surnameController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Insert your surname',
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 30),

                //state
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.orangeAccent[200],
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: TextField(
                        controller: _stateController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'which state are you from',
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 30),

                // passw
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.orangeAccent[200],
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: TextField(
                        controller: _passwordController,
                        //obscureText: true,
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                            icon: isPasswordVisible
                                ? Icon(Icons.visibility_off)
                                : Icon(Icons.visibility),
                            onPressed: () => setState(
                                () => isPasswordVisible = !isPasswordVisible),
                          ),
                          border: InputBorder.none,
                          hintText: 'Insert your password',
                        ),
                        obscureText: isPasswordVisible,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 30),

                // confrim password
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.orangeAccent[200],
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: TextField(
                        controller: _confirmPasswordController,
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                            icon: isPasswordVisible
                                ? Icon(Icons.visibility_off)
                                : Icon(Icons.visibility),
                            onPressed: () => setState(
                                () => isPasswordVisible = !isPasswordVisible),
                          ),
                          border: InputBorder.none,
                          hintText: 'Confirm your password',
                        ),
                        obscureText: isPasswordVisible,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 30),

                // data
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.orangeAccent[200],
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: TextField(
                        keyboardType: TextInputType.datetime,
                        controller: _dateController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Your date of birth',
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 30),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.orangeAccent[200],
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: TextField(
                        controller: _descriptionController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Little description of yourself',
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 30),

                // sign up button

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 100.0),
                  child: GestureDetector(
                    onTap: signUp,
                    child: Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          color: Colors.orangeAccent,
                          borderRadius: BorderRadius.circular(15)),
                      child: Center(
                        child: Text(
                          'Registrati',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 30),

                // not registered?
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('I am registered! '),
                    GestureDetector(
                      onTap: widget.showLoginPage,
                      child: Text(
                        'Login here',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
