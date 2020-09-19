import 'package:circular_bottom_navigation/tab_item.dart';
import 'package:flutter/material.dart';
import 'package:circular_bottom_navigation/circular_bottom_navigation.dart';

class Navbar extends StatefulWidget {
  @override
  _NavbarState createState() => _NavbarState();
  
}

class _NavbarState extends State<Navbar> {
  @override
  Widget build(BuildContext context) {

    final navbar = CircularBottomNavigation([TabItem(Icons.monetization_on, '', Colors.cyan)]);
    return navbar;
  }
  
}