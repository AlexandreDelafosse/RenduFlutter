import 'package:flutter/material.dart';
import '../data_base/data.dart';

class UserInformationPage extends StatefulWidget {
  final User user;

  UserInformationPage({required this.user, required String username, required String password});

  @override
  _UserInformationPageState createState() => _UserInformationPageState();
}

class _UserInformationPageState extends State<UserInformationPage> {
  TextEditingController _usernameController = TextEditingController();
  String _modifiedUsername = "";

  @override
  void initState() {
    super.initState();
    _usernameController.text = widget.user.loginUser;
  }

  void _updateUsername() {
    setState(() {
      _modifiedUsername = _usernameController.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Information'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Username: ${widget.user.loginUser}'),
            Text('Password: ${widget.user.loginPassword}'),
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(labelText: 'Nouveau nom d\'utilisateur'),
            ),
            ElevatedButton(
              onPressed: _updateUsername,
              child: Text('Modifier le nom d\'utilisateur'),
            ),
            Text('Nom d\'utilisateur modifié: $_modifiedUsername'),
          ],
        ),
      ),
    );
  }
}
