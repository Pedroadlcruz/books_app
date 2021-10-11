extension FormValidatorsExt on String {
  static final RegExp _emailRegExp = RegExp(
    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$',
  );

  String? isNameValid() {
    if (isEmpty) {
      return 'Favor escribir su nombre.';
    }
    if (length <= 2) {
      return 'Ingrese un nombre válido.';
    } else {
      return null;
    }
  }

  String? isEmailValid() {
    if (isEmpty) {
      return 'Favor escribir su correo electrónico.';
    }
    if (!_emailRegExp.hasMatch(this)) {
      return 'Ingrese un correo válido.';
    } else {
      return null;
    }
  }

  String? isPasswordValid() {
    if (isEmpty) {
      return 'Favor escribir su contraseña.';
    }
    if (length <= 7) {
      return 'La contraseña debe tener al menos 8 dígitos.';
    } else {
      return null;
    }
  }

  String? confirmPaswordValidator(String newPassword) {
    if (isEmpty) {
      return 'Favor repetir la nueva contraseña.';
    }
    if (this != newPassword) {
      return 'Las contraseñas no coinciden.';
    } else {
      return null;
    }
  }

  String? isRefValid() {
    final String name = replaceAll("-", "")
        .replaceAll(" ", "")
        .replaceAll(",", "")
        .replaceAll(".", "");
    if (name.isEmpty) {
      return 'Favor escribir un nombre de referencia.';
    }
    if (name.length <= 3) {
      return 'Ingrese un nombre válido.';
    } else {
      return null;
    }
  }
}
