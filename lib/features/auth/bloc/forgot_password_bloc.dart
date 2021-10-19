import 'package:flutter/material.dart';
import 'package:take_home_project/core/constants/strings.dart';
import 'package:take_home_project/core/error/auth_exceptions.dart';
import 'package:take_home_project/features/auth/repositories/auth_repository_impl.dart';

class ForgotPasswordBloc extends ChangeNotifier {
  final AuthRepositoryImpl _authRepository;

  ForgotPasswordBloc({required AuthRepositoryImpl authRepository})
      : _authRepository = authRepository;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String email = '';
  String errorMsg = '';

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  bool isValidForm() {
    return formKey.currentState?.validate() ?? false;
  }

  Future<bool> onForgotPasswordRequest() async {
    _isLoading = true;
    notifyListeners();
    try {
      await _authRepository.forgotPassword(email);
      _isLoading = false;

      notifyListeners();
      return true;
    } on ForgotPasswordFailure catch (e) {
      errorMsg = e.message;
      _isLoading = false;
      notifyListeners();
      return false;
    }
  }
}
