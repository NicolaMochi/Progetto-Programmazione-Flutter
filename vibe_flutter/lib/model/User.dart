// model dello user

class User {
  String? email;
  String? name;
  String? surname;
  String? password;
  String? birth;
  String? state;
  String? description;

  User(String email, String name, String surname, String password, String birth,
      String state, String description) {
    this.email;
    this.name = name;
    this.surname = surname;
    this.password = password;
    this.birth = birth;
    this.state = state;
    this.description = description;
  }
}
