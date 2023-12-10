class AppUser {
  final String id;
  final String? email;
  final String? username;
  final bool isAnonymous;

  AppUser({
    required this.id,
    this.email,
    this.username,
    required this.isAnonymous,
  });

  factory AppUser.fromJson(Map<String, dynamic> json) {
    return AppUser(
      id: json['id'],
      email: json['email'],
      username: json['username'],
      isAnonymous: json['isAnonymous'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'username': username,
      'isAnonymous': isAnonymous,
    };
  }
}