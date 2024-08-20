import 'package:clean_app/features/authenticatoin/data/models/user_model.dart';
import 'package:clean_app/features/authenticatoin/presentation/bloc/login_bloc/login_bloc.dart';
import 'package:clean_app/features/authenticatoin/presentation/bloc/login_bloc/login_event.dart';
import 'package:clean_app/features/authenticatoin/presentation/bloc/signup_bloc/signup_bloc.dart';
import 'package:clean_app/features/authenticatoin/presentation/bloc/signup_bloc/signup_event.dart';
import 'package:clean_app/features/authenticatoin/presentation/pages/loginPage.dart';
import 'package:clean_app/features/ecommerce/presentation/pages/home_page.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatelessWidget {
  const LoginPage();

  @override
  Widget build(BuildContext context) {
    final TextEditingController usernameController = TextEditingController();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    return SingleChildScrollView(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(50),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0,100,0,100),
                child: Container(
                  height: 50,
                  width: 150,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Color.fromRGBO(63, 81, 243, 1)),
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(4),
                    boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                spreadRadius: 0,
                blurRadius: 2,
                offset: Offset(0, 5), // changes position of shadow to bottom
              ),
            ],
                  ),
                  child: FittedBox(
                    fit: BoxFit.contain,
                    child: Text('ECOM',
                    style: TextStyle(
                      fontFamily: 'CaveatBrush',
                      color: Color.fromRGBO(63, 81, 243, 1)),
                    ),
                  ),
                ),
              ),
      
              Padding(
                padding: const EdgeInsets.fromLTRB(0,0,0,50),
                child: Text('Sign into your account',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 26,
                ),
                ),
              ),
      
              Align(
                alignment: Alignment.centerLeft,
                child: Text('Email')),
              SizedBox(height: 10),
              Container(
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 243, 242, 242),
                    borderRadius: BorderRadius.circular(4)),
                child: TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                  ),
                ),
              ),
              SizedBox(height: 10),
              Align(
                alignment: Alignment.centerLeft,
                child: Text('Password')),
              SizedBox(height: 10),
              Container(
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 243, 242, 242),
                    borderRadius: BorderRadius.circular(4)),
                child: TextField(
                  controller: passwordController,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                  ),
                ),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(500, 45),
                    backgroundColor: const Color.fromRGBO(63, 81, 243, 1),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4)),
                  ),
                  onPressed: () {
                    context.read<LoginBloc>().add(LoginRequested(
                        emailController.text, passwordController.text));
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomePage()));
                  },
                  child: const Text(
                    'SIGN IN',
                    style: TextStyle(color: Colors.white),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
