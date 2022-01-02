import 'dart:async';

import 'package:flutter/material.dart';
import 'package:take_home_project/core/constants/strings.dart';
import 'package:take_home_project/features/auth/models/user.dart';
import 'package:take_home_project/core/error/auth_exceptions.dart';
import 'package:take_home_project/features/auth/repositories/auth_repository_impl.dart';

class AuthBloc extends ChangeNotifier {
  final AuthRepositoryImpl _authRepository;
  late final StreamSubscription<User> _userSubscription;
  AuthBloc({required AuthRepositoryImpl authRepository})
      : _authRepository = authRepository,
        super() {
    _userSubscription = _authRepository.user.listen(
      (user) {
        currentUser = user;
        notifyListeners();
      },
    );
  }

  String errorMsg = '';
  Stream<User> get user => _authRepository.user;
  User currentUser = User.empty;

  Future<void> logOut() async {
    try {
      await _authRepository.logOut();
    } on LogOutFailure {
      errorMsg = Strings.unknownFailure;
      notifyListeners();
    }
  }

  Future<bool> deleteAccount() async {
    try {
      await _authRepository.deleteAccount();
      return true;
    } on DeleteAccountFailure {
      return false;
    }
  }

  Future<void> close() async => _userSubscription.cancel();
}
