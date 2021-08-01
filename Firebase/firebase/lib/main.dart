import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

void main() async {
  Firestore db = Firestore.instance;
  /* db.collection("usuarios").document("001").setData({
    //salva ou atualiza, basta colocar o numero certo
    "nome": "Melina",
    "idade": "28",
  });
 */
  /* DocumentReference ref = await db
      .collection("noticias")
      .add({"titulo": "Ondas de calor", "descricao": "texto de exemplo..."}); */
  //print("item salvo: " + ref.documentID );

/*   db.collection("Noticias")
  .document(" ")
  .setData("titulo" : "Ondas de calor em São Paulo",
  "descricao" : "texto base"); */

  //deletar usuario
  /* db.collection("usuarios").document("001").delete(); */

  //copiar dados do banco de dados
  /* DocumentSnapshot snapshot =
    await db.collection("usuarios").document("001").get();

  print("Dados:" + snapshot.data.toString());

  var dados = snapshot.data;
  print("dados: " + dados["nome"] + "idade:" + dados["idade"]); */

  /* QuerySnapshot querySnapshot = await db.collection("usuarios").getDocuments();
  print("Dados usuarios: " + querySnapshot.documents.toString());

  for (DocumentSnapshot item in querySnapshot.documents){
    var dados = item.data;
    print("Dados usuarios: " + dados["Nome"] + "-" + dados ["idade"]);
  } */

  /* db.collection("usuarios").snapshots().listen(snapshot){
    for (DocumentSnapshot item in snapshot.documents){
      var dados = item.data;
      print("dados usuarios:" + dados["nome"] + "-" + dados["idade"]);
    }
  }
  ); */
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
