import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/src/config/snackbar.dart';
import 'package:flutter_ecommerce_app/src/pages/mainPage.dart';
import 'package:flutter_ecommerce_app/src/pages/register_page.dart';
import 'package:flutter_ecommerce_app/src/services/authentificationService.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  AuthService authService = AuthService();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            Container(
              height: 350,
              child: Positioned(
                top: 0,
                left: 0,
                right: 0,
                bottom: 0,
                child: Image.asset(
                  "assets/logo.png",
                  height: 400,
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            TextField(
              controller: emailController,
              cursorColor: Colors.black,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(0.0),
                labelText: 'Email',
                hintText: 'Username or e-mail',
                labelStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 14.0,
                  fontWeight: FontWeight.w400,
                ),
                hintStyle: TextStyle(
                  color: Colors.grey,
                  fontSize: 14.0,
                ),
                prefixIcon: Icon(
                  CupertinoIcons.person,
                  color: Colors.black,
                  size: 18,
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade200, width: 2),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                floatingLabelStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 18.0,
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black, width: 1.5),
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              controller: passwordController,
              cursorColor: Colors.black,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(0.0),
                labelText: 'Password',
                hintText: 'Password',
                hintStyle: TextStyle(
                  color: Colors.grey,
                  fontSize: 14.0,
                ),
                labelStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 14.0,
                  fontWeight: FontWeight.w400,
                ),
                prefixIcon: Icon(
                  Icons.fingerprint,
                  color: Colors.black,
                  size: 18,
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade200, width: 2),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                floatingLabelStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 18.0,
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black, width: 1.5),
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'Forgot Password?',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 14.0,
                        fontWeight: FontWeight.w400),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 30,
            ),
            MaterialButton(
              onPressed: () {
                if (emailController.text.isEmpty) {
                  print("email empty");
                  ShowSnackBar().showSnackBar(
                      context,
                      "email empty",
                    );
                  return;
                }

                if (passwordController.text.isEmpty) {
                  print("password empty");
                  ShowSnackBar().showSnackBar(
                      context,
                      "password empty",
                    );
                  return;
                }

                authService
                    .login(emailController.text, passwordController.text)
                    .then((user) {
                  if (user.error == true) {
                    print(user.id);
                    ShowSnackBar().showSnackBar(
                      context,
                      user.id,
                    );
                  } else {
                    print("mrigel");
                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => MainPage()));

                  }
                });
              },
              height: 45,
              color: Colors.black,
              child: Text(
                "Login",
                style: TextStyle(color: Colors.white, fontSize: 16.0),
              ),
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 50),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Don\'t have an account?',
                  style: TextStyle(
                      color: Colors.grey.shade600,
                      fontSize: 14.0,
                      fontWeight: FontWeight.w400),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => RegisterPage()));
                  },
                  child: Text(
                    'Register',
                    style: TextStyle(
                        color: Colors.blue,
                        fontSize: 14.0,
                        fontWeight: FontWeight.w400),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    ));
  }
}
