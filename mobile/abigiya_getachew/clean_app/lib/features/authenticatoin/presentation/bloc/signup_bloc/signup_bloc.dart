import 'package:clean_app/features/authenticatoin/domain/usecases/signUp_usecase.dart';
import 'package:clean_app/features/authenticatoin/presentation/bloc/signup_bloc/signup_event.dart';
import 'package:clean_app/features/authenticatoin/presentation/bloc/signup_bloc/signup_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupBloc extends Bloc<SignupEvent,SignupState>{
  final SignupUsecase newUser;

  SignupBloc(this.newUser):super(SignupInitial()){
    on<SignupRequested>((event, emit) async{
      emit(SignupLoading());
      try{
        final result = await newUser(event.username, event.email, event.password);
        result.fold(
          (failure) => emit(SignupFailure('')),
          (user) => emit(SignupSuccess(user)),
          );
      }catch(e){
        emit(SignupFailure('Failed to sign up'));
      }
    },);
  }
}