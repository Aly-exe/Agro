class UserModel {
  final String id;
  final String email;
  final String name;
  final String? imageUrl;

  UserModel({
    required this.id,
    required this.email,
    required this.name,
    this.imageUrl,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      email: json['email'],
      name: json['full_name'],
      imageUrl: json['avatar_url'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'full_name': name,
      'avatar_url': imageUrl,
    };
  }
}