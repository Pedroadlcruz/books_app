import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:take_home_project/take_home_project.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(TakeHomeProjectApp());
}
