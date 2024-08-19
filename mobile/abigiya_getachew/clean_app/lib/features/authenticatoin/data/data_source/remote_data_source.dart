import 'dart:convert';

import 'package:clean_app/core/constants/constants.dart';
import 'package:clean_app/core/error/exception.dart';
import 'package:clean_app/features/authenticatoin/data/models/user_model.dart';
import 'package:clean_app/features/authenticatoin/domain/entities/user.dart';
import 'package:http/http.dart' as http;

abstract class UserRemoteDataSource {
  Future<String> login(String email, password);
  Future<UserModel> signUp(String userId,username,password);
}

class UserRemoteDataSourceImpl extends UserRemoteDataSource {
  final http.Client client;

  UserRemoteDataSourceImpl({required this.client});

  @override
  Future<String> login(String email, password) async {
    final response = await client.post(
      Uri.parse(Urls.userLoginBaseUrl), 
      headers: {'Content-Type' : 'application/json'},
      body: {
      'email': email,
      'password': password,
    });

    if (response.statusCode == 201) {
      final token = jsonDecode(response.body)['data']['access_token'];

      return token;
    }
    else{
      throw ServerException('Login Filed');
    }
  }

  @override
  Future<UserModel> signUp(String username, email, password) async {
    final response = await client.post(
      Uri.parse(Urls.userSignupBaseUrl), 
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
      'name' : username,
      'email': email,
      'password': password,
    }),
    );

    if (response.statusCode == 201) {
      final json = jsonDecode(response.body)['data'];

      return UserModel.fromJson(json);
    }
    else{
      throw ServerException('Sign Up Failed');
    }
  }
}
