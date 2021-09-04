import 'dart:html';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async'; //

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String _urlBase = "https://jsonplaceholder.typicode.com/";

  _recuperarPostagens(){

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Consummo de serviço avançado"),
      ),
      body: FutureBuilder<Map>(
      future: _recuperarPostagens(),
      builder: (context, snapshot) {
        // snapshot, dados que recuperei na requisição de uri
        String resultado;
        switch (snapshot.connectionState) {
          // verifica o estado da conexão
          case ConnectionState.none:
          case ConnectionState.waiting:
            resultado = "Carregando...";
            break;
          case ConnectionState.active:
          case ConnectionState.done:
            if (snapshot.hasError) {
              resultado = "Erro ao carregar os dados.";
            } else {
              double valor = snapshot.data?["BRL"]["buy"];
              resultado = "Preço do bitcoin: ${valor.toString()}";
            }
            break;
        }
        return Center(
          child: Text(resultado),
        );
      },
    )
    );
    
    
  }
}
