import 'package:clean_app/features/authenticatoin/data/models/user_model.dart';
import 'package:clean_app/features/authenticatoin/presentation/bloc/login_bloc/login_bloc.dart';
import 'package:clean_app/features/authenticatoin/presentation/bloc/login_bloc/login_event.dart';
import 'package:clean_app/features/authenticatoin/presentation/bloc/signup_bloc/signup_bloc.dart';
import 'package:clean_app/features/authenticatoin/presentation/bloc/signup_bloc/signup_event.dart';
import 'package:clean_app/features/authenticatoin/presentation/pages/login_page.dart';
import 'package:clean_app/features/authenticatoin/presentation/pages/signup_page.dart';
import 'package:clean_app/features/authenticatoin/presentation/widgets/text_of_fields.dart';
import 'package:clean_app/features/ecommerce/presentation/pages/home_page.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatelessWidget {
  const LoginPage();

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
              child: Padding(
                  padding: const EdgeInsets.all(50),
                  child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 70, 0, 70),
                          child: Container(
                            height: 50,
                            width: 150,
                            decoration: BoxDecoration(
                              border:
                                  Border.all(color: Color.fromARGB(255, 63, 81, 243)),
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(4),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.2),
                                  spreadRadius: 0,
                                  blurRadius: 2,
                                  offset: Offset(
                                      0, 5), // changes position of shadow to bottom
                                ),
                              ],
                            ),
                            child: FittedBox(
                              fit: BoxFit.cover,
                              child: Padding(
                                padding: const EdgeInsets.all(8),
                                child: Text(
                                  'ECOM',
                                  style: TextStyle(
                                      fontFamily: 'CaveatBrush',
                                      fontSize: 26,
                                      fontWeight: FontWeight.w400,
                                      color: Color.fromARGB(255, 63, 81, 243)),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 0, 50),
                          child: Text(
                            'Sign into your account',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 26,
                            ),
                          ),
                        ),
                        CustomTextField(label: 'Email', 
                        newController: emailController, 
                        placeholder: 'Enter your email'),
                        
                        SizedBox(height: 10),
                    
                        CustomTextField(label: 'Password', 
                        newController: passwordController, 
                        placeholder: 'Enter your password'),
                        
                        SizedBox(height: 20),
                        
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              minimumSize: Size(500, 45),
                              backgroundColor: const Color.fromARGB(255, 63, 81, 243),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8)),
                            ),
                            onPressed: () {
                              context.read<LoginBloc>().add(LoginRequested(
                                  emailController.text, passwordController.text));
                              Navigator.of(context).pushReplacementNamed('/home_page');
                            },
                            child: const Text(
                              'SIGN IN',
                              style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
                            )),
                
                            SizedBox(height: 150),
                
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('Don\'t have an account?',
                                style: TextStyle(color: Color.fromARGB(255, 136, 136, 136)),
                                ),
                                TextButton(onPressed: (){
                                  Navigator.of(context).pushReplacementNamed('/signup_page');
                                }, child: Text('SIGN UP',
                                style: TextStyle(
                                  color: Color.fromARGB(255, 63, 81, 243),
                                ),
                                ))
                              ],
                            )
                      ],
                    ),
                ),
        ),
    );
  }
}
