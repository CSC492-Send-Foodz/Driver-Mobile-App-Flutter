import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  final String name; 
  final int capacity;

  Dashboard({this.name, this.capacity});

  final profile = null;

  final news = null;

  final navigation = null; 

  @override
  Widget build(BuildContext context) {
    return Text('Welcome back, $name!');
  }
}
