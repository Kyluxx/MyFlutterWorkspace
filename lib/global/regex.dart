class Regex {
  static final email = RegExp(r'^[\w.-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');

  static bool isEmail(String input) {
    return email.hasMatch(input);
  }
}
