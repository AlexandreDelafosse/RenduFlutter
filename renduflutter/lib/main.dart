import 'package:flutter/material.dart';
import '/data_base/database.dart';
import 'package:users/login_screen.dart';

void main() async {
  final DatabaseHelper databaseHelper = DatabaseHelper.instance;
  runApp(MyApp(databaseHelper: databaseHelper));
}


class MyApp extends StatelessWidget {
  final DatabaseHelper databaseHelper;

  MyApp({required this.databaseHelper});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      home: LoginPage(databaseHelper: databaseHelper),
    );
  }
}
