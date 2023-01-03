
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/src/config/snackbar.dart';
import 'package:flutter_ecommerce_app/src/pages/login_page.dart';
import 'package:flutter_ecommerce_app/src/pages/mainPage.dart';
import 'package:flutter_ecommerce_app/src/services/authentificationService.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  AuthService authService = AuthService();
  
  TextEditingController firstnameController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();
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
            TextField(
              controller: firstnameController,
              cursorColor: Colors.black,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(0.0),
                labelText: 'Firstname',
                hintText: 'Firstname',
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
              controller: lastnameController,
              cursorColor: Colors.black,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(0.0),
                labelText: 'Lastname',
                hintText: 'lastname',
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
              controller: emailController,
              cursorColor: Colors.black,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(0.0),
                labelText: 'Email',
                hintText: 'Email',
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
                  CupertinoIcons.envelope,
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
           SizedBox(
              height: 20,
            ),
            
            SizedBox(
              height: 30,
            ),
            MaterialButton(
              onPressed: () {
                if (firstnameController.text.isEmpty) {
                  print("firstname empty");
                  ShowSnackBar().showSnackBar(
                      context,
                      "firstname empty",
                    );
                  return;
                }
                if (lastnameController.text.isEmpty) {
                  print("lastname empty");
                  ShowSnackBar().showSnackBar(
                      context,
                      "lastname empty",
                    );
                  return;
                }
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
                    .register(
                      firstnameController.text, 
                      lastnameController.text, 
                      emailController.text, 
                      passwordController.text)
                    .then((user) {
                  if (user.error == true) {
                    print(user.id);
                    ShowSnackBar().showSnackBar(
                      context,
                      user.id,
                    );
                  } else {
                    print("mrigel");
                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => LoginPage()));

                  }
                });
              },
              height: 45,
              color: Colors.black,
              child: Text(
                "Register",
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
                  'Already have an account?',
                  style: TextStyle(
                      color: Colors.grey.shade600,
                      fontSize: 14.0,
                      fontWeight: FontWeight.w400),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Login',
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
