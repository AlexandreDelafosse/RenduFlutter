import 'package:flutter/material.dart';
import 'package:users/data_base/database.dart';
import 'package:users/data_base/data.dart';

import 'package:users/pages/user_information.dart'; // Importez la page UserInformationPage

class LoginPage extends StatefulWidget {
  final DatabaseHelper databaseHelper;

  LoginPage({required this.databaseHelper});

  @override
  _LoginPageState createState() => _LoginPageState();

  void onLoginSuccess(BuildContext context, User user) {
    // Naviguez vers la page UserInformationPage avec les données fictives
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => UserInformationPage(user: user, username: '', password: '',),
      ),
    );
  }

}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _loginUserController = TextEditingController();
  final TextEditingController _loginPasswordController = TextEditingController();

  User? get fakeUser => null;

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
                  final fakeUser = fakeUsers.firstWhere(
                        (user) =>
                    user.loginUser == loginUser && user.loginPassword == loginPassword,
                    orElse: () => User(id: -1, loginUser: '', loginPassword: ''),
                  );

                  if (fakeUser.id != -1) {
                    // Utilisateur fictif trouvé, naviguez vers UserInformationPage
                    widget.onLoginSuccess(context, fakeUser);
                  } else {
                    // Utilisateur fictif non trouvé
                    print('Invalid credentials');
                  }
                } else {
                  print('Please fill in all fields.');
                }
              },
              child: Text('Login'),
            ),
            SizedBox(height: 20), // Espace entre les boutons
            ElevatedButton(
              onPressed: () {
                // Accédez à UserInformationPage avec des données fictives
                widget.onLoginSuccess(context, fakeUser!);

              },
              child: Text('Accéder à User Information'),
            ),
          ],
        ),
      ),
    );
  }
}
