import 'package:clean_app/core/error/failure.dart';
import 'package:clean_app/features/authenticatoin/data/models/user_model.dart';
import 'package:clean_app/features/authenticatoin/domain/entities/user.dart';
import 'package:clean_app/features/authenticatoin/domain/repositories/user_repository.dart';
import 'package:dartz/dartz.dart';

class SignupUsecase {
  UserRepository userRepositories;

  SignupUsecase(this.userRepositories);
  Future<Either<Failure, UserModel>> call(String username, email, password) async{
    return await userRepositories.signUp(username, email, password);
  }
}
