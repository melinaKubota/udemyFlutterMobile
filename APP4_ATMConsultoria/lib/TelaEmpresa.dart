import 'package:flutter/material.dart';

class TelaEmpresa extends StatefulWidget {
  @override
  _TelaEmpresaState createState() => _TelaEmpresaState();
}

class _TelaEmpresaState extends State<TelaEmpresa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text("Empresa"),
          backgroundColor: Colors.green,

        ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              Row(
                children: [
                  Image.asset("image/detalhe_empresa.png"),
                  Padding(
                      padding: EdgeInsets.only(left:10),
                    child: Text(
                      "Sobre a Empresa",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.deepOrange
                      ),
                    )
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top:16),
                child: Text (
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam eget ligula eu lectus lobortis condimentum. Aliquam nonummy auctor massa. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nulla at risus. Quisque purus magna, auctor et, sagittis ac, posuere eu, lectus. Nam mattis, felis ut adipiscing"
                ),
              )
            ],
          )
        )
      )
    );
  }
}
