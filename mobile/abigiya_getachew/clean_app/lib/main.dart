import 'dart:async';

import 'package:clean_app/core/di.dart';
import 'package:clean_app/features/ecommerce/presentation/BLoC/home_bloc/home_page_bloc.dart';
import 'package:clean_app/features/ecommerce/presentation/BLoC/home_bloc/home_page_event.dart';
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
        home: HomePage());
  }
}
