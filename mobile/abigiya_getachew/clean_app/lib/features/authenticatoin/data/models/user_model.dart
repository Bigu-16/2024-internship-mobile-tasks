

import 'package:clean_app/features/authenticatoin/domain/entities/user.dart';

class UserModel extends User {
  
  final String userId;
  final String username;
  final String email;

  const UserModel(
    {
    required this.userId,
    required this.username,
    required this.email,}
    
  ) : super(userId: '', username: '', email: '');
  
  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
      userId: json['userId'] ?? '',
      username: json['username'] ?? '',
      email: json['email'] ?? '',
  );
    static List<UserModel> listFromJson(List<dynamic> jsonList) {
    return jsonList.map((json) => UserModel.fromJson(json as Map<String, dynamic>)).toList();
  }

  Map<String, dynamic> toJson() => {
    'userid': userId,
    'username': username,
    'email': email,
  };

  User toEntity() => User(userId: userId,username: username,email: email);
  UserModel toModel() {
  return UserModel(
    userId: userId,
    username: username,
    email: email, 
  );
}

}
