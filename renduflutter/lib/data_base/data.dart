class User {
  final int id;
  final String loginUser;
  final String loginPassword;

  User({
    required this.id,
    required this.loginUser,
    required this.loginPassword,
  });
}


List<User> fakeUsers = [
  User(id: 1, loginUser: 'utilisateur1', loginPassword: 'password1'),
  User(id: 2, loginUser: 'utilisateur2', loginPassword: 'password2'),
  User(id: 3, loginUser: 'utilisateur3', loginPassword: 'password3'),
];
