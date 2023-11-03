class Validater {
  static String? genaralvalid(String value) {
    if (value.isEmpty) {
      return "This field can't be empty";
    }
    return null;
  }

  static String? signupPassword(String value) {
    if (value.isEmpty) {
      return "Please enter a password";
    } else if (value.length < 7) {
      return "Password must be at least 7 characters";
    }
    return null;
  }

  static String? confirmPassword(String password, confirmPassword) {
    if (password != confirmPassword) {
      return "Password do not match.";
    }
    return null;
  }

  static String? validEmail(String email) {
    bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
    if (email.isEmpty) {
      return "This field can't be empty";
    } else if (emailValid == false) {
      return "Please enter a correct email";
    }
    return null;
  }

  static String? validMobile(String email) {
    String pattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
    bool mobileValid = RegExp(pattern).hasMatch(email);
    if (email.isEmpty) {
      return "This field can't be empty";
    } else if (mobileValid == false) {
      return "Please enter a valid mobile no";
    }
    return null;
  }

  static String? isNumeric(String s) {
    if (s.isEmpty) {
      return "Please enter value";
    }
    if (double.tryParse(s) != null) {
      return null;
    } else {
      return "invalid value";
    }
  }
}
