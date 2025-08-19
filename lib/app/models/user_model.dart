
// app/models/user_model.dart
class User {
  final String id;
  final String name;
  final String email;
  final String phone;
  final String nickname;
  final String certificateGroup;
  final String networkInfo;
  final String? portfolioUrl;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.nickname,
    required this.certificateGroup,
    required this.networkInfo,
    this.portfolioUrl,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      phone: json['phone'] ?? '',
      nickname: json['nickname'] ?? '',
      certificateGroup: json['certificateGroup'] ?? '',
      networkInfo: json['networkInfo'] ?? '',
      portfolioUrl: json['portfolioUrl'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'phone': phone,
      'nickname': nickname,
      'certificateGroup': certificateGroup,
      'networkInfo': networkInfo,
      'portfolioUrl': portfolioUrl,
    };
  }
}
