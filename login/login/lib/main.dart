import 'package:flutter/material.dart';
import 'package:login/login.dart';

void main() {
  runApp(MaterialApp(
    home: Login(),
    theme: ThemeData(
      primaryColor: Color(0xff075E54), 
      accentColor: Color(0xff25D366)
    )
  )
  );
} 


