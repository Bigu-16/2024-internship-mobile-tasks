import 'dart:async';

import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Color myColor;

    Timer(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacementNamed('/signup_page');
    });

    myColor = Color.fromARGB(255, 63, 81, 243);
    Color lighterColor = myColor.withOpacity(0.2);

    return Container(
        decoration: BoxDecoration(
          // color: myColor,
          gradient: LinearGradient(
          colors: [lighterColor, myColor], // Lighter color at the top, myColor at the bottom
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
          image: DecorationImage(
              image: AssetImage('image/splash_screen.png'),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                  myColor.withOpacity(0.2), BlendMode.dstATop)),
        ),
        
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0,250,0,0),
                  child: Align(
                    alignment: Alignment.center,
                    child: Column(
                      children: [
                        Container(
                          height: 100,
                          width: 250,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: FittedBox(
                            fit: BoxFit.cover,
                            child: Padding(
                              padding: const EdgeInsets.all(16),
                              child: Text(
                                'ECOM',
                                style: TextStyle(
                                    fontFamily: 'CaveatBrush',
                                    fontSize: 100,
                                    fontWeight: FontWeight.w500,
                                    color: Color.fromARGB(255, 63, 81, 243)),
                              ),
                            ),
                          ),
                        ),
                    SizedBox(height: 15),
                    Text('ECOMMERCE APP', style: TextStyle(
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                      fontSize: 40,
                    ),),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
