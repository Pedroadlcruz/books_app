import 'package:flutter/material.dart';
import 'package:take_home_project/features/auth/repositories/auth_exceptions.dart';
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
  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  Future<bool> onLoginRequest() async {
    _isLoading = true;
    notifyListeners();
    try {
      await _authRepository.logInWithEmailAndPassword(
          email: email, password: password);
      return true;
    } on LogInWithEmailAndPasswordFailure catch (e) {
      errorMsg = e.message;
      notifyListeners();
      return false;
    }
  }

  bool isValidForm() {
    return formKey.currentState?.validate() ?? false;
  }
}
