import 'package:flutter/material.dart';
import 'package:take_home_project/features/auth/models/user.dart';
import 'package:take_home_project/features/auth/repositories/auth_exceptions.dart';
import 'package:take_home_project/features/auth/repositories/auth_repository_impl.dart';

class AuthBloc extends ChangeNotifier {
  final AuthRepositoryImpl _authRepository;

  AuthBloc({required AuthRepositoryImpl authRepository})
      : _authRepository = authRepository;

  String errorMsj = '';

  Stream<User> get authStatusChanges => _authRepository.user;

  Future<void> logOut() async {
    try {
      await _authRepository.logOut();
    } on LogOutFailure {
      errorMsj = 'An unknown failure occurred.';
      notifyListeners();
    }
  }
}
