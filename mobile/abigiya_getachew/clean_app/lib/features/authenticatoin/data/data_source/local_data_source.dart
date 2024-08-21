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
    try{
    await sharedPreferences.setString('CACHED_TOKEN', token);
  }catch(e){
    throw ('erroe: $e');
  }}
  
  
  @override
  Future<String?> getCachedToken() async {
    try{
      return sharedPreferences.getString('CACHED_TOKEN');
    }catch(e){
      throw ('error: $e');
      }
  }

  @override
  Future<void> clearToken() async {
    try{await sharedPreferences.remove('CACHED_TOKEN');
    }catch(e){
      throw ('error: $e');
      }
  }

 
}