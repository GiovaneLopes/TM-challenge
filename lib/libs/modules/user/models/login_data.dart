class LoginData {
  final String cpf;
  final String password;

  LoginData({
    required this.cpf,
    required this.password,
  });
  Map<String, String> toMap() {
    return {
      'cpf': cpf,
      'password': password,
    };
  }

  factory LoginData.fromMap(Map<String, String> map) {
    return LoginData(
      cpf: map['cpf'] ?? '',
      password: map['password'] ?? '',
    );
  }
}
