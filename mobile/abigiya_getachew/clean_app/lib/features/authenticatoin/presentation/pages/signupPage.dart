import 'package:clean_app/features/authenticatoin/data/models/user_model.dart';
import 'package:clean_app/features/authenticatoin/presentation/bloc/signup_bloc/signup_bloc.dart';
import 'package:clean_app/features/authenticatoin/presentation/bloc/signup_bloc/signup_event.dart';
import 'package:clean_app/features/authenticatoin/presentation/pages/loginPage.dart';
import 'package:clean_app/features/ecommerce/presentation/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SingUpPage extends StatelessWidget {
  const SingUpPage();

  @override
  Widget build(BuildContext context) {
    final TextEditingController usernameController = TextEditingController();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    final TextEditingController confirmPasswordController = TextEditingController();

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Name'),
            SizedBox(height: 10),
            Container(
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 243, 242, 242),
                  borderRadius: BorderRadius.circular(4)),
              child: TextField(
                controller: usernameController,
                decoration: InputDecoration(
                  border: InputBorder.none,
                ),
              ),
            ),
            SizedBox(height: 10),
            Text('Email'),
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
            Text('Password'),
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
            Text('Confirm password'),
            SizedBox(height: 10),
            Container(
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 243, 242, 242),
                  borderRadius: BorderRadius.circular(4)),
              child: TextField(
                controller: confirmPasswordController,
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
                  context.read<SignupBloc>().add(SignupRequested(
                      usernameController.text,
                      emailController.text,
                      passwordController.text));
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoginPage()));
                },
                child: const Text(
                  'SIGN UP',
                  style: TextStyle(color: Colors.white),
                ))
          ],
        ),
      ),
    );
  }
}
