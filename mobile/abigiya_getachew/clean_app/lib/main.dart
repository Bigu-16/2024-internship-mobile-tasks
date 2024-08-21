import 'dart:async';

import 'package:clean_app/core/di.dart';
import 'package:clean_app/features/authenticatoin/data/models/user_model.dart';
import 'package:clean_app/features/authenticatoin/domain/usecases/signUp_usecase.dart';
import 'package:clean_app/features/authenticatoin/presentation/bloc/login_bloc/login_bloc.dart';
import 'package:clean_app/features/authenticatoin/presentation/bloc/signup_bloc/signup_bloc.dart';
import 'package:clean_app/features/authenticatoin/presentation/pages/login_page.dart';
import 'package:clean_app/features/authenticatoin/presentation/pages/signup_page.dart';
import 'package:clean_app/features/authenticatoin/presentation/pages/splash_screen.dart';
import 'package:clean_app/features/ecommerce/presentation/BLoC/add_and_update/add_and_update_bloc.dart';
import 'package:clean_app/features/ecommerce/presentation/BLoC/delete_block/delete_bloc.dart';
import 'package:clean_app/features/ecommerce/presentation/BLoC/home_bloc/home_page_bloc.dart';
import 'package:clean_app/features/ecommerce/presentation/BLoC/home_bloc/home_page_event.dart';
import 'package:clean_app/features/ecommerce/presentation/BLoC/search_bloc/search_bloc.dart';
import 'package:clean_app/features/ecommerce/presentation/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await setup();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<HomePageBloc>(
          create: (BuildContext context) => getIt.get<HomePageBloc>()..add(FetchData()),
        ),
        BlocProvider<AddBloc>(
          create: (BuildContext context) => getIt.get<AddBloc>(),
        ),
        BlocProvider<UpdateBloc>(
          create: (BuildContext context) => getIt.get<UpdateBloc>(),
        ),
        BlocProvider<DeleteBloc>(
          create: (BuildContext context) => getIt.get<DeleteBloc>(),
        ),
        BlocProvider<SearchBloc>(
          create: (BuildContext context) => SearchBloc(),
        ),
        BlocProvider(
          create: (BuildContext context) => getIt.get<SignupBloc>(),
        ),
        BlocProvider(
          create: (BuildContext context) => getIt.get<LoginBloc>(),
        ),
      ],
      child: Root(),
    ),
  );
}

class Root extends StatelessWidget {
  const Root({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'Poppins',
        ),
        home: const SplashScreen(),
        routes: {
        '/signup_page': (context) => SignupPage(),  
        '/login_page' : (context) => LoginPage(),
        '/home_page' : (context) => HomePage(),
      },
      );
  }
}
