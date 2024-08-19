import 'package:clean_app/core/error/failure.dart';
import 'package:clean_app/features/authenticatoin/data/models/user_model.dart';
import 'package:clean_app/features/authenticatoin/domain/entities/user.dart';
import 'package:dartz/dartz.dart';

abstract class UserRepository{
  Future<Either<Failure,UserModel>>signUp(String username, email,password);
  Future<Either<Failure,String>>login(String email,password);
  Future<void>logout();
  Future<void>saveToken(String token);
  Future<String>getToken();
}