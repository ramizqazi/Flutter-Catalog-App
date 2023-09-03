// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/routes.dart';

class MyLoginButton extends StatefulWidget {
  const MyLoginButton({super.key});

  @override
  State<MyLoginButton> createState() => _MyLoginButtonState();
}

class _MyLoginButtonState extends State<MyLoginButton> {
  bool changeBtn = false;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.deepPurple,
      borderRadius: BorderRadius.circular(changeBtn ? 50 : 8),
      child: InkWell(
        splashColor: Colors.white,
        child: AnimatedContainer(
          width: changeBtn ? 50 : 150,
          height: 50,
          duration: Duration(seconds: 1),
          alignment: Alignment.center,
          child: changeBtn
              ? Icon(
                  Icons.done,
                  color: Colors.white,
                )
              : Text(
                  "Login",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
        ),
        onTap: () async {
          setState(() {
            changeBtn = !changeBtn;
          });
          await Future.delayed(Duration(seconds: 1));
          await Navigator.pushNamed(context, MyRoutes.homeRoute);
          setState(() {
            changeBtn = false;
          });
        },
      ),
    );
  }
}
