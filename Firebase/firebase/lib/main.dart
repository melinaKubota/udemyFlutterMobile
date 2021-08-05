import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseFirestore db = FirebaseFirestore.instance;
  db.collection("usuarios").doc("001").set({
    //salva ou atualiza, basta colocar o numero certo
    "nome": "Melina",
    "idade": "28",
  });

  DocumentReference ref = await db.collection("noticias").add({
    "titulo": "Ondas de calor",
    "descricao": "texto de exemplo...",
  });

  print("item salvo: " + ref.id);

  db.collection("noticias").doc(" ").set({
    "titulo": "Ondas de calor em São Paulo",
    "descricao": "texto base",
  });

  //deletar usuario
  db.collection("usuarios").doc("001").delete();

  //copiar dados do banco de dados
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

  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('Hello world!'),
    );
  }
}
