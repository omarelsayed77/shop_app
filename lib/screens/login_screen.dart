// ignore_for_file: prefer_const_constructors

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/providers/newProvider.dart';
import 'package:shop_app/screens/register.dart';
import 'package:provider/provider.dart';
import 'home_screen.dart';

class logIn extends StatefulWidget {
  const logIn({Key? key}) : super(key: key);

  @override
  State<logIn> createState() => _logInState();
}

class _logInState extends State<logIn> {
  bool showPassword = true;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50),
          child: Form(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 70, 0, 130),
                  child: Container(
                    child: Image.asset('images/amit.jpeg'),
                  ),
                ),
                TextFormField(
                  controller: emailController,
                  autofocus: true,
                  decoration: InputDecoration(
                      hintText: 'Email',
                      labelText: 'Email',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15))),
                ),
                SizedBox(
                  height: 30,
                ),
                TextFormField(
                  controller: passwordController,
                  obscureText: showPassword,
                  decoration: InputDecoration(
                      hintText: 'Password',
                      labelText: 'Password',
                      suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              showPassword = !showPassword;
                            });
                          },
                          icon: Icon((showPassword == true)
                              ? Icons.visibility_off
                              : Icons.visibility)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15))),
                ),
                SizedBox(
                  height: 50,
                ),
                Material(
                  elevation: 5,
                  borderRadius: BorderRadius.circular(10),
                  child: MaterialButton(
                    // elevation: 5,
                    minWidth: 200,
                    height: 40,
                    color: Colors.red[500],
                    onPressed: () {
                      context.read<newProvider>().logInFun(
                          emailController.text, passwordController.text);

                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => homeScreen(),
                          ));
                    },
                    child: Text(
                      'Log In',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => register(),
                          ));
                    },
                    child: Text(
                      'Go SignUp',
                      style: TextStyle(color: Colors.black),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
