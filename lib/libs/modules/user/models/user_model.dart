class UserModel {
  final String id;
  final String name;
  final String email;
  final String cpf;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.cpf,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      cpf: (json['cpf'] as String).split('@').first,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'cpf': '$cpf@insurancecompany.com',
    };
  }
}
