import 'package:flutter/material.dart';
import 'package:youtube/telas/inicio.dart';
import 'package:youtube/telas/emAlta.dart';
import 'package:youtube/telas/inscricoes.dart';
import 'package:youtube/telas/biblioteca.dart';

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
      Incricoes(),
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
      body: Container(
        padding: EdgeInsets.all(16),
        child: telas[_indiceAtual],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _indiceAtual,
        onTap: (indice) {
          setState(() {
            _indiceAtual = indice;
          });
        },
        type: BottomNavigationBarType.fixed, //fixed define uma cor de fundo fixa(para até 3 botoes), shifting - troca a cor dos icones
        fixedColor: Colors.red,
        items: [
          BottomNavigationBarItem(// a barra que fica em baixo
              //backgroundColor: Colors.orange, (CASO QUEIRA QUE FIQUE NESSA CORES QUANDO SELECIONA, COLOCAR SHIFTING NO TYPE BOTTOM NAVIGATOR)
              label: ("Inicio"),
              icon: Icon(Icons.home)),
          BottomNavigationBarItem(
              //backgroundColor: Colors.red,
              label: ("Em alta"),
              icon: Icon(Icons.whatshot)),
          BottomNavigationBarItem(
              //backgroundColor: Colors.blue,
              label: ("Inscrições"),
              icon: Icon(Icons.subscriptions)),
          BottomNavigationBarItem(
              //backgroundColor: Colors.green,
              label: ("Bibliotecas"),
              icon: Icon(Icons.folder)),
        ],
      ),
    );
  }
}
