import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:c19app/prescreens/FadeAnimation.dart';

class Reset extends StatefulWidget {
  @override
  _ResetState createState() => _ResetState();
}

class _ResetState extends State<Reset> {
  @override
  Widget build(BuildContext context) {
    String _email;
    final auth = FirebaseAuth.instance;

    return Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/second.jpg'),
            fit: BoxFit.fill,
          ),
        ),
        child: Scaffold(
          // By defaut, Scaffold background is white
          // Set its value to transparent
          backgroundColor: Colors.transparent,
          resizeToAvoidBottomInset: false,
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                height: 200,
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    //Welcome back text
                    FadeAnimation(
                      1,
                      Text(
                        'Hey, \nForgot that Password?',
                        style: TextStyle(
                            fontSize: 30,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    FadeAnimation(
                      1,
                      Container(
                        padding: EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          children: <Widget>[
                            // Type email to reset
                            Container(
                              padding: EdgeInsets.all(10.0),
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    color: Colors.grey[100],
                                  ),
                                ),
                              ),
                              child: TextField(
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Type email to reset',
                                  hintStyle: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),

                            //login button
                            SizedBox(
                              height: 20.0,
                            ),
                            FadeAnimation(
                                1,
                                RaisedButton(
                                    color: const Color(0xffFF4C29),
                                    child: Text('Signin'),
                                    onPressed: () {
                                      auth.sendPasswordResetEmail(
                                          email: _email);
                                      Navigator.of(context).pop();
                                    }))
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
