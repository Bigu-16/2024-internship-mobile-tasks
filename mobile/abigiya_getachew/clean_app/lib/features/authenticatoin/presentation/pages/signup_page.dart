import 'package:clean_app/features/authenticatoin/presentation/bloc/signup_bloc/signup_bloc.dart';
import 'package:clean_app/features/authenticatoin/presentation/bloc/signup_bloc/signup_event.dart';
import 'package:clean_app/features/authenticatoin/presentation/bloc/signup_bloc/signup_state.dart';
import 'package:clean_app/features/authenticatoin/presentation/pages/login_page.dart';
import 'package:clean_app/features/authenticatoin/presentation/widgets/terms_popup.dart';
import 'package:clean_app/features/authenticatoin/presentation/widgets/text_of_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupPage extends StatefulWidget {
  const SignupPage();

  @override
  State<SignupPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignupPage> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController usernameController = TextEditingController();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    final TextEditingController confirmPasswordController =
        TextEditingController();
    bool isTermsAccepted = false;

    return BlocListener<SignupBloc, SignupState>(
      listener: (context, state) {
        if (state is SignupSuccess) {
          Navigator.of(context).pushReplacementNamed('/login_page');
        } else if (state is SignupFailure) {
          // Display an error message
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message)),
          );
        }
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(35, 50, 50, 30),
                child: Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.of(context).pushReplacementNamed('/login_page');
                        },
                        icon: Icon(
                          Icons.arrow_back_ios_new,
                          color: Color.fromARGB(255, 63, 81, 243),
                          size: 20,
                        )),
                    Spacer(),
                    Container(
                      height: 25,
                      width: 60,
                      decoration: BoxDecoration(
                        border:
                            Border.all(color: Color.fromARGB(255, 63, 81, 243)),
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
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
                          padding: const EdgeInsets.all(2),
                          child: Text(
                            'ECOM',
                            style: TextStyle(
                                fontFamily: 'CaveatBrush',
                                fontSize: 24,
                                fontWeight: FontWeight.w400,
                                color: Color.fromARGB(255, 63, 81, 243)),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(50, 0, 50, 50),
                child: Column(
                  children: [
                    Text(
                      'Create your account',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 27,
                      ),
                    ),
                    SizedBox(height: 20),
                    CustomTextField(
                        label: 'Name',
                        newController: usernameController,
                        placeholder: 'Enter your name'),
                    SizedBox(height: 10),
                    CustomTextField(
                        label: 'Email',
                        newController: emailController,
                        placeholder: 'Enter your email'),
                    SizedBox(height: 10),
                    CustomTextField(
                        label: 'Password',
                        newController: passwordController,
                        placeholder: 'Enter your password'),
                    SizedBox(height: 10),
                    CustomTextField(
                        label: 'Confirm password',
                        newController: confirmPasswordController,
                        placeholder: 'Re-enter your password'),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Checkbox(
                          value: isTermsAccepted,
                          onChanged: (bool? value) {
                            setState(() {
                              isTermsAccepted = value ?? false;
                            });
                          },
                          activeColor: Color.fromARGB(255, 63, 81, 243),
                          checkColor: Colors.white,
                          side: WidgetStateBorderSide.resolveWith(
                            (states) => BorderSide(
                              color: Color.fromARGB(255, 63, 81, 243),
                              width: 1.0,
                            ),
                          ),
                        ),
                        Text(
                          'I understood the',
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                        TextButton(
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return TermsAndPrivacy();
                                  });
                            },
                            child: Text(
                              'terms & policy.',
                              style: TextStyle(
                                color: Color.fromARGB(255, 63, 81, 243),
                              ),
                            )),
                      ],
                    ),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(500, 45),
                          backgroundColor:
                              const Color.fromARGB(255, 63, 81, 243),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                        ),
                        onPressed: () {
                          if (passwordController.text ==
                              confirmPasswordController.text) {
                            context.read<SignupBloc>().add(SignupRequested(
                                usernameController.text,
                                emailController.text,
                                passwordController.text));
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                  content: Text(
                                      'Passwords do not match. Please try again.')),
                            );
                          }
                        },
                        child: const Text(
                          'SIGN UP',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        )),
                    SizedBox(height: 100),
                    Row(
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Have an account?',
                          style: TextStyle(
                              color: Color.fromARGB(255, 136, 136, 136)),
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.of(context)
                                  .pushReplacementNamed('/login_page');
                            },
                            child: Text(
                              'SIGN IN',
                              style: TextStyle(
                                color: Color.fromARGB(255, 63, 81, 243),
                              ),
                            ))
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
