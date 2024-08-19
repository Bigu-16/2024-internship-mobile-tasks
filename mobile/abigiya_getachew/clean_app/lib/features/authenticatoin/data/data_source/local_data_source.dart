import 'dart:convert';

import 'package:clean_app/features/authenticatoin/data/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class UserLocalDataSource{
  Future<void> cacheToken(String token);
  Future<String?> getCachedToken();
  Future<void> clearToken();
}

class UserLocalDataSourceImpl extends UserLocalDataSource{
  final SharedPreferences sharedPreferences;

  UserLocalDataSourceImpl({required this.sharedPreferences});
  
  @override
  Future<void> cacheToken(String token) async{
    await sharedPreferences.setString('CACHED_TOKEN', token);
  }
  
  
  @override
  Future<String?> getCachedToken() async {
    return sharedPreferences.getString('CACHED_TOKEN');
  }

  @override
  Future<void> clearToken() async {
    await sharedPreferences.remove('CACHED_TOKEN');
  }

 
}