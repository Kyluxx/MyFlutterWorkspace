class Regex {
  static final email = RegExp(r'^[\w.-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
  static final passwordStrength = RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[\W_]).{8,}$');
  
  static bool isEmail(String input) {
  final emailRegex = RegExp(
    r'^[\w\.-]+@([\w-]+\.)+[a-zA-Z]{2,}$'
  );
  return emailRegex.hasMatch(input.trim());
}

}
