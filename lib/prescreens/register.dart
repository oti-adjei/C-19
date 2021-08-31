import 'package:c19app/prescreens/Login.dart';
import 'package:c19app/prescreens/otp.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:c19app/prescreens/FadeAnimation.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  String _email, _password;
  final auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    void _login() {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return Login();
      }));
    }

    void _register() {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return Login();
      }));
    }

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
                height: 100,
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    FadeAnimation(
                      1,
                      Text(
                        'Hi there,\nJoin our family',
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
                            //Full Name
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
                                  hintText: 'Full Name',
                                  hintStyle: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),

                            //Email
                            Container(
                              padding: EdgeInsets.all(10.0),
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(color: Colors.grey[100]),
                                ),
                              ),
                              child: TextField(
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: 'Email',
                                      hintStyle: TextStyle(
                                        color: Colors.white,
                                      )),
                                  onChanged: (value) {
                                    setState(() {
                                      _email = value.trim();
                                    });
                                  }),
                            ),

                            //Password
                            Container(
                              padding: EdgeInsets.all(10.0),
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(color: Colors.grey[100]),
                                ),
                              ),
                              child: TextField(
                                  obscureText: true,
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: 'Password',
                                      hintStyle: TextStyle(
                                        color: Colors.white,
                                      )),
                                  onChanged: (value) {
                                    setState(() {
                                      _password = value.trim();
                                    });
                                  }),
                            ),

                            //Retype password
                            Container(
                              padding: EdgeInsets.all(10.0),
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(color: Colors.grey[100]),
                                ),
                              ),
                              child: TextField(
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'Retype Password',
                                    hintStyle: TextStyle(
                                      color: Colors.white,
                                    )),
                              ),
                            ),

                            // Sign Up button
                            SizedBox(
                              height: 20.0,
                            ),
                            FadeAnimation(
                                1,
                                RaisedButton(
                                  color: const Color(0xffFF4C29),
                                  child: Text('Signin'),
                                  onPressed: () => _signup(_email, _password),
                                )

                              // InkWell(
                              //     child: Container(
                              //       height: 50,
                              //       margin:
                              //           EdgeInsets.symmetric(horizontal: 60),
                              //       decoration: BoxDecoration(
                              //         borderRadius: BorderRadius.circular(50),
                              //         color: Colors.blueAccent,
                              //       ),
                              //       child: Center(
                              //         child: Text(
                              //           'Login',
                              //           style: TextStyle(color: Colors.white),
                              //         ),
                              //       ),
                              //     ),

                              //     onTap: _profile()),
                            ),

                            //Login text
                            SizedBox(
                              height: 20.0,
                            ),
                            FadeAnimation(
                              1,
                              InkWell(
                                child: Center(
                                  child: Text(
                                    'Login',
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                onTap: _login,
                              ),
                            )
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

  _signup(String _email, String _password) async {
    try {
      //Create Get Firebase Auth User
      await auth.createUserWithEmailAndPassword(
          email: _email, password: _password);

      //Success
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context) => Otp()));
    } on FirebaseAuthException catch (error) {
      Fluttertoast.showToast(
        msg: error.message,
        gravity: ToastGravity.TOP,
      );
    }
  }
}
