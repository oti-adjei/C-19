// ignore_for_file: prefer_const_constructors

import 'package:c19app/prescreens/Login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import "package:flutter/material.dart";
import 'package:c19app/screens/home_page.dart';

class Splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Positioned(
            bottom: 0,
            top: 0,
            right: 0,
            left: 0,
            child: Image.asset(
              "assets/welcome.jpg",
              fit: BoxFit.fitHeight,
            ),
          ),
          Container(
            width: double.infinity,
            child: Column(
              children: <Widget>[
                Spacer(),
                Container(
                  height: 500,
                  width: 500,
                  child: Image.asset(
                    "assets/logo.png",
                    fit: BoxFit.fitHeight,
                  ),
                ),
                MyButton(
                  buttonColor: Color(0xffFF4C29),
                  border: null,
                  buttonText: "Login",
                ),
                Spacer(),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class MyButton extends StatelessWidget {
  final Color buttonColor;
  final Border border;
  final String buttonText;
  const MyButton(
      {Key key, @required this.buttonColor, this.border, this.buttonText})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
         FirebaseAuth.instance.currentUser == null ? Navigator.push(context, MaterialPageRoute(builder: (context) {
              return Login();})) : Navigator.push(context, MaterialPageRoute(builder: (context) {
           return MyHomePage();}));
        // Navigator.push(context, MaterialPageRoute(builder: (context) {
        //   return Login();
        // }));
      },
      child: Container(
        width: MediaQuery.of(context).size.width / 2.3,
        decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadius.circular(15),
          border: border,
        ),
        padding: EdgeInsets.symmetric(vertical: 9.0),
        child: Center(
          child: Text(
            buttonText,
            style: TextStyle(color: Colors.white, fontSize: 21),
          ),
        ),
      ),
    );
  }
}
