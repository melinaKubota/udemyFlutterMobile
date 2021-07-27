import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {


  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  TextEditingController _controllerAlcool = TextEditingController();
  TextEditingController _controllerGasolina = TextEditingController();


  void _calcular(){
    double precoAlcool = double.tryParse(_controllerAlcool.text);
    double precoGasolina = double.tryParse(_controllerGasolina.text);
    String _textoResultado = "";
    if ( precoAlcool == null || precoGasolina){
      setState((){
        _textoResultado = "Número inválido, digite números maiores que 0 e utilizando (.)";
      });
    }
    }else{
      if (( precoAlcool/precoGasolina) >= 0.7){
        setState(() {
          _textoResultado = "Melhor abastacer com gasolina";
        });
      }else{
        setState((){
        _textoResultado = "Melhor abastecer com alcool";
        });
      }
      _limparCampos();
    }
  }

  void _limparCampos(){
    _controllerGasolina.text = "";
    _controllerAlcool.text = "";
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text ('alcool ou gasolina'),
          backgroundColor: Colors.blue,
      ),
      body: Container(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(32),
          child: Column (
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
              Padding(
              padding: EdgeInsets.only(bottom: 32),
              child: Image.asset("image/logo.png"),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 10),
            child: Text(""
              "Qual é a melhor opção para abastecer a moto",
            style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold
            ),
          ),
        ),
          TextField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: "Preço ALcool, ex1.59"
          ),
            style: TextStyle(
              fontSize: 22
          ),
          controller: _controllerAlcool,
        ),
          TextField( keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: "Preço Gasolina, ex5.59"
          ),
            style: TextStyle(
              fontSize: 22
          ),
            controller: _controllerGasolina),
          Padding(
            padding: EdgeInsets.only(top: 10),
            child: ElevatedButton(
             child: Text (
                "Calcular",
                style: TextStyle(
                    fontSize: 20
                )
            ),
            onPressed: _calcular,
          ),
        ),
          Padding(
            padding: EdgeInsets.only(top:20),
            child: Text(
                 _textoResultado,
                style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
             ),
            ),
           ],
          ) ,
        ),
      ),
    );
  }
}
