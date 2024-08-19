import 'package:clean_app/features/authenticatoin/data/models/user_model.dart';

abstract class SignupState{}

class SignupInitial extends SignupState{}

class SignupLoading extends SignupState{}

class SignupSuccess extends SignupState{
  final UserModel user;

  SignupSuccess(this.user);
}

class SignupFailure extends SignupState{
  final String message;

  SignupFailure(this.message);
}