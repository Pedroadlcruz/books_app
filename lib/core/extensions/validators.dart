extension FormValidatorsExt on String {
  //Email regular expresion
  static final RegExp _emailRegExp = RegExp(
    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$',
  );

  /// Returns [null] if given string [isNotEmpty] and
  /// [length] is greater than or equal to [2]
  String? get isNameValid {
    if (isEmpty) {
      return 'Please write your name.';
    }
    if (length <= 2) {
      return 'Please enter a valid name.';
    } else {
      return null;
    }
  }

  /// Returns [null] if given string [isNotEmpty] and
  /// [hasMatch] with the given email regular expresion
  String? get isEmailValid {
    if (isEmpty) {
      return 'Please write your email.';
    }
    if (!_emailRegExp.hasMatch(this)) {
      return 'Please enter a valid email.';
    } else {
      return null;
    }
  }

  /// Returns [null] if given string [isNotEmpty] and
  /// [length] is greater than or equal to [8]
  String? get isPasswordValid {
    if (isEmpty) {
      return 'Please write your password.';
    }
    if (length <= 7) {
      return 'Must be at least 8 digits long.';
    } else {
      return null;
    }
  }

  /// Returns [null] if given string [isNotEmpty] and
  /// [is equal] to the given password
  String? confirmPaswordValidator(String newPassword) {
    if (isEmpty) {
      return 'Please repeat the new password.';
    }
    if (this != newPassword) {
      return 'Passwords do not match.';
    } else {
      return null;
    }
  }
}
