import 'package:ios_c19/prescreens/Login.dart';
import "package:flutter/material.dart";

class Splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            Positioned(
              bottom: 0,
              top: 0,
              right: 0,
              left: 0,
              child: Image.asset(
                "assets/bgb.jpg",
                fit: BoxFit.fitHeight,
              ),
            ),
            Container(
              width: double.infinity,
              child: Column(
                children: <Widget>[
                  Spacer(),

                  Spacer(),
                  Text(
                    "TRAVaL",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 31,
                    ),
                  ),
                  Text(
                    "Prepare your own trip with us",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 21,
                    ),
                  ),
                  Spacer(),
                  MyButton(
                    buttonColor: Color(0xff48808d),
                    border: null,
                    buttonText: "Login",
                  ),
                  SizedBox(
                    height: 11,
                  ),

                  Spacer(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class MyButton extends StatelessWidget {
  final Color buttonColor;
  final Border border;
  final String buttonText;
  const MyButton(
      {Key key, @required this.buttonColor, this.border,  this.buttonText})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(builder: (context) {
              return Login();}));;
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
