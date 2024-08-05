import 'package:flutter/material.dart';
import 'package:product_app/details_page.dart';
import 'package:product_app/home_page.dart';
import 'package:product_app/search_page.dart';
import 'package:product_app/update_page.dart';

void main() {
  runApp(Root());
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
      initialRoute: '/',
      routes:{
        '/':(context) => const RootPage(),
        // '/SearchPage': (context) => const SearchPage(),
        '/UpdatePage': (context) => const Parent(),
        // '/DetailsPage': (context) => DetailsPage(),

      },
      // home: const RootPage(),
    );
  }
}

