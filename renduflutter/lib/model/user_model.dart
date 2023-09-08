class User {
  final int id;
  final String loginUser;
  final String loginPassword;

  User({
    required this.id,
    required this.loginUser,
    required this.loginPassword,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'loginUser': loginUser,
      'loginPassword': loginPassword,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'],
      loginUser: map['loginUser'],
      loginPassword: map['loginPassword'],
    );
  }
}
