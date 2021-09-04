import 'dart:html';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert'; // converter a string em json

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController _controllerCep = TextEditingController();
  String _resultado = "Resultado";

  _recuperarCep() async {
    //async = vai esperar para processar a mensagem, pois o http que vai recuperar os dados da url nao sabemos quanto tempo vai durar a reposta
    String cepDigitado = _controllerCep
        .text; //recuperar o cep que foi digitado dentro de uma caixa de texto, por exemplo
    String url = "https://viacep.com.br/ws/${cepDigitado}/json/";
    Uri uri = Uri(path: url);

    http.Response response;
    response = await http.get(uri);
    // get = permite passar uma url para ser executada;
    Map<String, dynamic> retorno = jsonDecode(response
        .body); //para fazer uso do jsonDecode é preciso importar o convert
    String logradouro = retorno["logradouro"];
    String complemento = retorno["complemento"];
    String bairro = retorno["bairro"];
    String localidade = retorno["localidade"];

    setState(() {
      // configurar o _resutado
      _resultado = "${logradouro}, ${complemento}, ${bairro}, ${localidade}";
    });

    print(
        "Reposta logradouro: ${logradouro} complemento ${complemento} bairro ${bairro} localidade ${localidade}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Consumo de serviço web"),
        ),
        body: Container(
          padding: EdgeInsets.all(40),
          child: Column(
            children: [
              TextField(
                keyboardType: TextInputType.number,
                decoration:
                    InputDecoration(labelText: "Digite o cep: ex: 01525000"),
                style: TextStyle(
                  fontSize: 20,
                ),
                controller:
                    _controllerCep, // fazer um atributo la em cima, para recuperar o que o usuario digitou
              ),
              RaisedButton(
                onPressed: _recuperarCep,
                child: Text(
                  "Clique aqui",
                ),
              ),
              Text(_resultado)
            ],
          ),
        ));
  }
}
