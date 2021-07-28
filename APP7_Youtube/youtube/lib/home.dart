import 'package:flutter/material.dart';
import 'package:youtube/telas/biblioteca.dart';
import 'package:youtube/telas/emAlta.dart';
import 'package:youtube/telas/inicio.dart';
import 'package:youtube/telas/inscricao.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _indiceAtual = 0;
  @override
  Widget build(BuildContext context) {
    List<Widget> telas = [ //"paginas" no meu app
      Inicio(),
      EmAlta(),
      Inscricao(),
      Biblioteca()
    ];
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.grey,
          opacity: 1,
        ),
        backgroundColor: Colors.white,
        title: Image.asset(
          "images/youtube.png",
          width: 98,
          height: 22,
        ),
        actions: [
          IconButton(
              onPressed: () {
                print("acao: videocam");
              },
              icon: Icon(Icons.videocam)),
          IconButton(
              onPressed: () {
                print("acao: pesquisa");
              },
              icon: Icon(Icons.search)),
          IconButton(
              onPressed: () {
                print("acao: conta");
              },
              icon: Icon(Icons.account_circle)),
        ],
      ),
      body: telas[_indiceAtual],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _indiceAtual,
        onTap: (indice) {
          setState(() {
            _indiceAtual = indice;
          });
        },
        type: BottomNavigationBarType.fixed,
        fixedColor: Colors.red,
        items: [
          BottomNavigationBarItem(
              //backgroundColor: Colors.orange, (CASO QUEIRA QUE FIQUE NESSA CORES QUANDO SELECIONA, COLOCAR SHIFTING NO TYPE BOTTOM NAVIGATOR)
              title: Text("Inicio"),
              icon: Icon(Icons.home)),
          BottomNavigationBarItem(
              //backgroundColor: Colors.red,
              title: Text("Em alta"),
              icon: Icon(Icons.whatshot)),
          BottomNavigationBarItem(
              //backgroundColor: Colors.blue,
              title: Text("Inscrições"),
              icon: Icon(Icons.subscriptions)),
          BottomNavigationBarItem(
              //backgroundColor: Colors.green,
              title: Text("Bibliotecas"),
              icon: Icon(Icons.folder)),
        ],
      ),
    );
  }
}
