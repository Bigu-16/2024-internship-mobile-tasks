import 'package:clean_app/core/error/failure.dart';
import 'package:clean_app/features/authenticatoin/domain/entities/user.dart';
import 'package:clean_app/features/authenticatoin/domain/repositories/user_repository.dart';
import 'package:dartz/dartz.dart';

class LoginUsecase{
  UserRepository userRepository;
  LoginUsecase(this.userRepository);

  Future<Either<Failure,String>> call(String email,password){
    return userRepository.login(email, password);
  }

}