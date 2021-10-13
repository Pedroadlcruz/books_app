import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:take_home_project/books_app.dart';
import 'package:take_home_project/features/auth/repositories/auth_repository_impl.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  final authRepository = AuthRepositoryImpl();
  await authRepository.user.first;
  runApp(BooksApp(authRepository: authRepository));
}
