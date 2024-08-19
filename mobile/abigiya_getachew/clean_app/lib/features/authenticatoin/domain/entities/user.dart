import 'package:equatable/equatable.dart';

class User extends Equatable{
  final String userId;
  final String username;
  final String email;
  // final String password;

  const User({
    required this.userId,
    required this.username,
    required this.email,
    // required this.password = ,
  });
  
  @override
  List<Object?> get props => [
    userId,
    username,
    email,
    // password,
  ];

}