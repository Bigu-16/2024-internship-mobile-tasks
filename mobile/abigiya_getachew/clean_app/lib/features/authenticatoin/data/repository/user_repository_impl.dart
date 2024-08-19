import 'package:clean_app/core/error/exception.dart';
import 'package:clean_app/core/error/failure.dart';
import 'package:clean_app/core/platform/newtwork_info.dart';
import 'package:clean_app/features/authenticatoin/data/data_source/local_data_source.dart';
import 'package:clean_app/features/authenticatoin/data/data_source/remote_data_source.dart';
import 'package:clean_app/features/authenticatoin/data/models/user_model.dart';
import 'package:clean_app/features/authenticatoin/domain/repositories/user_repository.dart';
import 'package:dartz/dartz.dart';

class UserRepositoryImpl extends UserRepository{
  late final NetworkInfo networkInfo;
  late final UserRemoteDataSource userRemoteDataSource;
  late final UserLocalDataSource userLocalDataSource;

  UserRepositoryImpl({
    required this.networkInfo,
    required this.userRemoteDataSource,
    required this.userLocalDataSource,
  });

  @override
  Future<Either<Failure, String>> login(String email, password)async {
    if (await networkInfo.isConnected){
      try{
        final token = await userRemoteDataSource.login(email, password);

        await userLocalDataSource.cacheToken(token);
        return Right(token);
      } on ServerException{
        return Left(ServerFailure('Failed to fetch'));
      }
    }else{
      return Left(NetworkFailure('No connection, Please connect to the internet'));
    }
  }

  @override
  Future<Either<Failure, UserModel>> signUp(String username,email, password) async{
    if (await networkInfo.isConnected){
      try{
        final user = await userRemoteDataSource.signUp(username, email, password);
        return Right(user);
      }on ServerException{
        return Left(ServerFailure('Failed to signup'));
      }
    }else{
      return Left(NetworkFailure('No connection, Please connect to the internet'));
    }
  }


  @override
  Future<String> getToken() async{
    final token = await userLocalDataSource.getCachedToken();
    if(token != null){
      return token;
    }else{
      throw CacheException('No token found');
    }
  }


  @override
  Future<void> logout() async {
    await userLocalDataSource.clearToken();
  }

  @override
  Future<void> saveToken(String token) async{
    await userLocalDataSource.cacheToken(token);
  }


  
}