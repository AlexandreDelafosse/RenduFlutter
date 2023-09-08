import 'package:flutter/material.dart';
import 'package:users/data_base/database.dart';

class LoginPage extends StatefulWidget {
  final DatabaseHelper databaseHelper;

  LoginPage({required this.databaseHelper});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _loginUserController = TextEditingController();
  final TextEditingController _loginPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Page'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _loginUserController,
              decoration: InputDecoration(labelText: 'Login User'),
            ),
            TextField(
              controller: _loginPasswordController,
              decoration: InputDecoration(labelText: 'Login Password'),
              obscureText: true,
            ),
            ElevatedButton(
              onPressed: () async {
                final loginUser = _loginUserController.text;
                final loginPassword = _loginPasswordController.text;

                if (loginUser.isNotEmpty && loginPassword.isNotEmpty) {
                  final userId = await widget.databaseHelper.insertUser(
                    loginUser,
                    loginPassword,
                  );
                  print('Inserted user with ID: $userId');
                } else {
                  print('Please fill in all fields.');
                }
              },
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
