import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

void main() {
  //Inicializar o firebase
  WidgetsFlutterBinding.ensureInitialized();

  ToFirestore.instance
    .collection("Usuarios"
    .document("portuacao")
  .setData("Melina": "25")

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
