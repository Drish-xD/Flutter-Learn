class ValidatorMixin {
  String? validateEmail(String? value) {
    if (!value!.contains("@")) {
      return "Please Enter a valid email.";
    }
    return null;
  }

  String? validatePass(String? value) {
    if (value!.length < 8) {
      return "Please must be atleast 8 characters.";
    }
    return null;
  }
}
