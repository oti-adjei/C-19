import 'package:flutter/material.dart';
import 'package:ios_c19/prescreens/FadeAnimation.dart';
import 'package:ios_c19/prescreens/register.dart';
import 'package:ios_c19/screens/home_page.dart';
import 'reset.dart';


class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}



class _LoginState extends State<Login> {
  @override


  Widget build(BuildContext context) {
    void _profile() {
      Navigator.push(
          context,
          MaterialPageRoute(builder: (context) {
            return MyHomePage();}));}
    void _register() {
      Navigator.push(
          context,
          MaterialPageRoute(builder: (context) {
            return Register();}));}
    void _reset() {
      Navigator.push(
          context,
          MaterialPageRoute(builder: (context) {
            return Reset();}));}
    return Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Colors.green, Colors.yellow])),
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
                child: Stack(
                  children: <Widget>[
                  ],
                ),
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
                        'Hello There, \nwelcome back',
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
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Email',
                                  hintStyle: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
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
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'Password',
                                    hintStyle: TextStyle(
                                      color: Colors.white,
                                    )),
                              ),
                            ),

                            //Reset Password
                            SizedBox(
                              height: 20,
                            ),
                            FadeAnimation(
                              1,
                              InkWell(
                              child:Center(
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

                              InkWell(
                                  child: Container(
                                    height: 50,
                                    margin: EdgeInsets.symmetric(horizontal: 60),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      color: Colors.blueAccent,


                                    ),

                                    child: Center(
                                      child: Text(
                                        'Login',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ),
                                  onTap:_profile
                              ),
                            ),

                            //Create account
                            SizedBox(
                              height: 20.0,
                            ),
                            FadeAnimation(
                              1,
                              InkWell(
                                child:Center(

                                    child: Text(
                                      'Create Account',
                                      style: TextStyle(
                                        color: Colors.white,
                                  ),
                                ),
                              ),
                                  onTap:_register,
                              )
                            ),
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

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Text("This is Home")
    );
  }
}
