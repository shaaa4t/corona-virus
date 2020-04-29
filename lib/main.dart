import 'package:flutter/material.dart';

import 'homeScreen.dart';


void main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
        fontFamily: 'Circular',
        primaryColor: Colors.blueGrey.shade900
    ),
    home: HomeScreen(),
  ));
}