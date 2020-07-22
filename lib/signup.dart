import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextStyle style = TextStyle(fontFamily: 'Nunito', fontSize: 20.0);
  BoxDecoration pinPutDecoration = BoxDecoration(
    border: Border.all(color: Colors.greenAccent, width: 2.0),
    borderRadius: BorderRadius.circular(15),
  );

  @override
  Widget build(BuildContext context) {
    final title = Text(
      'sign up',
      style: style.copyWith(
          fontSize: 60.0, color: Colors.white24, fontWeight: FontWeight.w900),
    );
    final name = TextField(
        style: style.copyWith(color: Colors.white),
        decoration: InputDecoration(
            prefixIcon: Icon(Icons.text_fields,
                // color: Colors.white38,
                color: Colors.greenAccent),
            contentPadding: EdgeInsets.fromLTRB(10.0, 15.0, 20.0, 15.0),
            border: InputBorder.none,
            hintText: '',
            hintStyle: style.copyWith(color: Colors.white54)));
    final email = TextField(
        style: style.copyWith(color: Colors.white),
        decoration: InputDecoration(
            prefixIcon: Icon(Icons.alternate_email,
                // color: Colors.white38,
                color: Colors.greenAccent),
            contentPadding: EdgeInsets.fromLTRB(10.0, 15.0, 20.0, 15.0),
            border: InputBorder.none,
            hintText: '',
            hintStyle: style.copyWith(color: Colors.white54)));
    final phone = TextField(
        style: style.copyWith(color: Colors.white),
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
            prefixIcon: Icon(Icons.phone_android,
                // color: Colors.white38,
                color: Colors.greenAccent),
            contentPadding: EdgeInsets.fromLTRB(10.0, 15.0, 20.0, 15.0),
            border: InputBorder.none,
            hintText: '',
            hintStyle: style.copyWith(color: Colors.white54)));
    final switchToSignin = Text.rich(TextSpan(children: [
      TextSpan(
          text: "Already have an account? ",
          style: TextStyle(color: Colors.white30)),
      TextSpan(
          text: 'Sign in!',
          style: TextStyle(color: Colors.white60, fontWeight: FontWeight.bold),
          recognizer: TapGestureRecognizer()
            ..onTap = () {
              print('display sign in page');
            }),
    ]));
    final loginBtn = Material(
        elevation: 0,
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(0),
        child: MaterialButton(
            minWidth: MediaQuery.of(context).size.width / 4,
            padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
            onPressed: () {},
            child: Icon(
              Icons.input,
              //color: Color.fromARGB(255, 12, 91, 96),
              color: Colors.white70,
              size: 30.0,
            )));

    return Scaffold(
        body:
        Container(
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
            child: Padding(
              padding: const EdgeInsets.all(40.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  title,
                  SizedBox(height: MediaQuery.of(context).size.height / 10),
                  name,
                  SizedBox(height: 5.0),
                  email,
                  SizedBox(height: 5.0),
                  phone,
                  SizedBox(
                    height: 5.0,
                  ),
                  switchToSignin,
                  SizedBox(
                    height: 10.0,
                  ),
                  loginBtn,
                ],
              ),
            ),
          ),
        ),
    );
  }
}

// Stage connection to firestore DB


