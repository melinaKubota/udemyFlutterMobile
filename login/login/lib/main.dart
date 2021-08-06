import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
/* import 'package:login/login.dart'; */
/* import 'dart:html'; */

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseFirestore db = FirebaseFirestore.instance;
  db.collection("usuarios").doc("005").set({
    "nome": "Melina", 
    "idade": "28",
  });

  /* runApp(MaterialApp(
      home: Login(),
      theme: ThemeData(
          primaryColor: Color(0xff075E54), accentColor: Color(0xff25D366)))); */
 /*  DocumentReference ref = await db.collection("login").add({
    "titulo": "Ondas de calor",
    "descricao": "texto de exemplo...", */
  
  DocumentSnapshot snapshot = await db.collection("usuarios").doc("001").get();

  print("Dados:" + snapshot.data.toString());

if (snapshot.data() != null) {
    Map<String, dynamic> dados = snapshot.data as Map<String, dynamic>;
    print("dados: " + dados["nome"] + "idade:" + dados["idade"]);
  }
  QuerySnapshot querySnapshot = await db.collection("usuarios").get();
  print("Dados usuarios: " + querySnapshot.docs.toString());

  for (DocumentSnapshot item in querySnapshot.docs) {
    Map<String, dynamic> dados = item.data as Map<String, dynamic>;
    print("Dados usuarios: " + dados["Nome"] + "-" + dados["idade"]);
  }
  db.collection('usuarios').snapshots().listen((event) {
    for (DocumentSnapshot item in snapshot.data()) {
      Map<String, dynamic> dados = item.data as Map<String, dynamic>;
      print("dados usuarios:" + dados["nome"] + "-" + dados["idade"]);
    }
  });


}
