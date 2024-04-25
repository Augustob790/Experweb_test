class UserModel {
  final String name;
  final String email;
  final String password;
  final String id;

  UserModel({
    required this.name,
    required this.email,
    required this.password,
    required this.id,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] ?? "",
      name: json['name'] ?? "",
      email: json['email'] ?? "",
      password: json['password'] ?? "",
    );
  }

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "password": password,
      };
}