import 'package:clean_app/features/authenticatoin/domain/usecases/login_usecase.dart';
import 'package:clean_app/features/authenticatoin/presentation/bloc/login_bloc/login_event.dart';
import 'package:clean_app/features/authenticatoin/presentation/bloc/login_bloc/login_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginBloc extends Bloc<LoginEvent,LoginState>{
  final LoginUsecase user;

  LoginBloc(this.user):super(LoginInitial()){
    on<LoginRequested>((event, emit) async{
      emit(LoginLoading());
      try{
        final result = await user(event.email, event.password);
        result.fold(
          (failure) => emit(LoginFailure('User not found')),
          (user) => emit(LoginSuccess('Token Found')),
          );
      }catch(e){
        emit(LoginFailure('Failed to login'));
      }
    },);
  }
}