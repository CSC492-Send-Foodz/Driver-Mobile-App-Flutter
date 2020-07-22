import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'signup.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _buildBody(context),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Container();
          }

          if (snapshot.connectionState == ConnectionState.done) {
            return MaterialApp(
              title: 'Flutter Demo',
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                primarySwatch: Colors.green,
                visualDensity: VisualDensity.adaptivePlatformDensity,
              ),
              home: SignUpPage(),
            );
          }
          return Container();
        });
  }
}

// ignore: missing_return
Future<Widget> _buildBody(BuildContext context) async {
  final baseUrl =
      'https://us-central1-send-foodz-1a677.cloudfunctions.net/app/order/statusUpdate';
  var res =
      await http.post(baseUrl, body: {'id': '12345', 'status': 'Picked up'});

  print(res.statusCode);
  print(res.body);
}
