import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';
import 'login.dart';

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
            hintText: 'Name',
            hintStyle: style.copyWith(color: Colors.white54)));
    final email = TextField(
        style: style.copyWith(color: Colors.white),
        decoration: InputDecoration(
            prefixIcon: Icon(Icons.alternate_email,
                // color: Colors.white38,
                color: Colors.greenAccent),
            contentPadding: EdgeInsets.fromLTRB(10.0, 15.0, 20.0, 15.0),
            border: InputBorder.none,
            hintText: 'E-mail',
            hintStyle: style.copyWith(color: Colors.white54)));
    final capacity = SleekCircularSlider(
        appearance: CircularSliderAppearance(
            customWidths:
                CustomSliderWidths(trackWidth: 1, progressBarWidth: 2),
            customColors: CustomSliderColors(
                trackColor: Colors.white,
                progressBarColor: Colors.orange,
                hideShadow: true),
            infoProperties: InfoProperties(
                topLabelStyle: TextStyle(
                    color: Colors.orangeAccent,
                    fontSize: 30,
                    fontWeight: FontWeight.w600),
                topLabelText: 'Capacity',
                mainLabelStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 50.0,
                    fontWeight: FontWeight.w100),
                modifier: (double value) {
                  final capacity = (value).toInt();
                  return '$capacity kg';
                }),
            startAngle: 180,
            angleRange: 270,
            size: 200.0,
            animationEnabled: false),
        min: 5,
        max: 1000,
        initialValue: 40,
        onChange: (double value) {
          print(value);
        });
    // TextField(
    //     style: style.copyWith(color: Colors.white),
    //     keyboardType: TextInputType.number,
    //     decoration: InputDecoration(
    //         prefixIcon: Icon(Icons.airport_shuttle,
    //             // color: Colors.white38,
    //             color: Colors.greenAccent),
    //         contentPadding: EdgeInsets.fromLTRB(10.0, 15.0, 20.0, 15.0),
    //         border: InputBorder.none,
    //         hintText: 'Capacity',
    //       hintStyle: style.copyWith(color: Colors.white54)));
    final switchToSignin = Text.rich(TextSpan(children: [
      TextSpan(
          text: "Already have an account? ",
          style: TextStyle(color: Colors.white30)),
      TextSpan(
          text: 'Sign in!',
          style: TextStyle(color: Colors.white60, fontWeight: FontWeight.bold),
          recognizer: TapGestureRecognizer()
            ..onTap = () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LoginPage()),
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
            onPressed: () {},
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
                capacity,
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
