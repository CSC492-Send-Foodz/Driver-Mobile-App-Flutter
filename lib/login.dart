import 'package:driver_mobile/signup.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
//import 'package:pinput/pin_put/pin_put.dart';
import 'package:firebase_auth/firebase_auth.dart';
//import 'package:google_sign_in/google_sign_in.dart';
import 'dashboard.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

void _handleSignIn(context, email, password) async {
  FirebaseUser user;
  //bool isLoggedIn = await _googleSignIn.isSignedIn();

  // if (isLoggedIn) {
  //   user = await _auth.currentUser();
  // } else {
  //   // final AuthResult googleUser = await _auth.signInWithEmailAndPassword(email: email, password: password);
  //   // final GoogleSignInAuthentication googleAuth =
  //   //     await googleUser.authentication;

  //   // final AuthCredential credential = GoogleAuthProvider.getCredential(
  //   //   accessToken: googleAuth.accessToken,
  //   //   idToken: googleAuth.idToken,
  //   // );
  //   user = (await _auth.signInWithEmailAndPassword(email: email, password: password)).user;
  // }

  try {
    user = (await _auth.signInWithEmailAndPassword(
            email: email, password: password))
        .user;

    FirebaseUser username = await FirebaseAuth.instance.currentUser();
    print('user is $username');
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                Dashboard(name: username.uid)));
  } catch (error) {
    switch (error.code) {
      case 'ERROR_WRONG_EMAIL':
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                  content: Container(
                      child: Text('Your email is invalid. Please try again.')));
            });
        break;
      case 'ERROR_WRONG_PASSWORD':
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                  content: Container(
                      child: Text(
                          "Your password doesn't match our records. Please try again.")));
            });
        break;
      case 'Error_USER_NOT_FOUND':
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                  content: Container(
                      child: Text("You're not registered yet. Sign up!")));
            });
        break;
      default:
    }
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var _email = TextEditingController();
  var _password = TextEditingController();

  TextStyle style = TextStyle(fontFamily: 'Nunito', fontSize: 20.0);
  BoxDecoration pinPutDecoration = BoxDecoration(
    border: Border.all(color: Colors.greenAccent, width: 2.0),
    borderRadius: BorderRadius.circular(15),
  );

  @override
  Widget build(BuildContext context) {
    final title = Text(
      'log in',
      style: style.copyWith(
          fontSize: 60.0, color: Colors.white24, fontWeight: FontWeight.w900),
    );

    final email = TextField(
        style: style.copyWith(color: Colors.white),
        controller: _email,
        decoration: InputDecoration(
            prefixIcon: Icon(Icons.alternate_email,
                // color: Colors.white38,
                color: Colors.greenAccent),
            contentPadding: EdgeInsets.fromLTRB(10.0, 15.0, 20.0, 15.0),
            border: InputBorder.none,
            hintText: 'E-mail',
            hintStyle: style.copyWith(color: Colors.white54)));
    final password = TextField(
        style: style.copyWith(color: Colors.white),
        controller: _password,
        obscureText: true,
        decoration: InputDecoration(
            prefixIcon: Icon(Icons.lock_outline,
                // color: Colors.white38,
                color: Colors.greenAccent),
            contentPadding: EdgeInsets.fromLTRB(10.0, 15.0, 20.0, 15.0),
            border: InputBorder.none,
            hintText: 'Password',
            hintStyle: style.copyWith(color: Colors.white54)));

    final switchToSignup = Text.rich(TextSpan(children: [
      TextSpan(
          text: "Don't have an account? ",
          style: TextStyle(color: Colors.white30)),
      TextSpan(
          text: 'Sign up!',
          style: TextStyle(color: Colors.white60, fontWeight: FontWeight.bold),
          recognizer: TapGestureRecognizer()
            ..onTap = () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SignUpPage()),
              );
            }),
    ]));

    final loginBtn = Material(
        elevation: 0,
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(0),
        child: MaterialButton(
            minWidth: MediaQuery.of(context).size.width / 4,
            padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
            onPressed: () =>
                _handleSignIn(context, _email.text, _password.text),
            child: Icon(
              Icons.input,
              //color: Color.fromARGB(255, 12, 91, 96),
              color: Colors.white70,
              size: 30.0,
            )));

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Color.fromARGB(255, 4, 62, 73),
                Color.fromARGB(255, 30, 117, 119)
              ]),
        ),
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.all(40.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                title,
                SizedBox(height: MediaQuery.of(context).size.height / 7),
                email,
                SizedBox(height: 10.0),
                password,
                SizedBox(
                  height: 15.0,
                ),
                loginBtn,
                SizedBox(
                  height: 20.0,
                ),
                switchToSignup,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
