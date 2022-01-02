import 'package:flutter/material.dart';
import 'package:take_home_project/core/constants/strings.dart';
import 'package:take_home_project/core/error/auth_exceptions.dart';
import 'package:take_home_project/features/auth/repositories/auth_repository_impl.dart';

class LoginBloc extends ChangeNotifier {
  final AuthRepositoryImpl _authRepository;

  LoginBloc({required AuthRepositoryImpl authRepository})
      : _authRepository = authRepository;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String email = '';
  String password = '';
  String errorMsg = '';

  bool _isLoading = false;
  bool obscureText = true;
  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  void toggleVisibility() {
    obscureText = !obscureText;
    notifyListeners();
  }

  bool isValidForm() {
    return formKey.currentState?.validate() ?? false;
  }

  Future<bool> onLoginRequest() async {
    _isLoading = true;
    notifyListeners();
    try {
      await _authRepository.logInWithEmailAndPassword(
          email: email, password: password);
      _isLoading = false;
      notifyListeners();
      return true;
    } on LogInWithEmailAndPasswordFailure catch (e) {
      errorMsg = e.message;
      _isLoading = false;
      notifyListeners();
      return false;
    } on Exception {
      errorMsg = Strings.unknownException;
      _isLoading = false;
      notifyListeners();
      return false;
    }
  }

  Future<bool> onLoginWithGoogle() async {
    _isLoading = true;
    notifyListeners();
    try {
      await _authRepository.logOut();
      await _authRepository.logInWithGoogle();
      _isLoading = false;
      notifyListeners();
      return true;
    } on LogInWithGoogleFailure catch (e) {
      errorMsg = e.message;
      _isLoading = false;
      notifyListeners();
      return false;
    }
  }
}
