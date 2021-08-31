import 'package:c19app/prescreens/welcome.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:c19app/prescreens/FadeAnimation.dart';
import 'package:c19app/prescreens/register.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'reset.dart';
import 'package:c19app/screens/home_page.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String _email, _password;
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    void _register() {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return Register();
      }));
    }

    void _reset() {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return Reset();
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
                height: 150,

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
                        'Hello there, \nWelcome back',
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
                            //Email
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
                                  keyboardType: TextInputType.emailAddress,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'Email',
                                    hintStyle: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                  onChanged: (value) {
                                    setState(() {
                                      _email = value.trim();
                                    });
                                  }),
                            ),

                            //password
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

                            //Reset Password
                            SizedBox(
                              height: 20,
                            ),
                            FadeAnimation(
                              1,
                              InkWell(
                                child: Center(
                                  child: Text(
                                    'Forgot Password?',
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                onTap: _reset,
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
                                    onPressed: () => _signin(_email, _password))

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

                            //Create account
                            SizedBox(
                              height: 20.0,
                            ),
                            FadeAnimation(
                                1,
                                InkWell(
                                  child: Center(
                                    child: Text(
                                      'Create Account',
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  onTap: _register,
                                )),
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

  _signin(String _email, String _password) async {
    try {
      //Create Get Firebase Auth User
      await auth.signInWithEmailAndPassword(email: _email, password: _password);

      //Success
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context) => MyHomePage()));
    } on FirebaseAuthException catch (error) {
      Fluttertoast.showToast(msg: error.message, gravity: ToastGravity.TOP);
    }
  }
}

// class Home extends StatelessWidget {
//   final auth = FirebaseAuth.instance;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: Container(
//             child: Center(
//                 child: ElevatedButton(
//                     child: Text('Signin'),
//                     onPressed: () {
//                       auth.signOut();
//                       Navigator.of(context).pushReplacement(
//                           MaterialPageRoute(builder: (context) => Splash()));
//                     }))));
//   }
// }
