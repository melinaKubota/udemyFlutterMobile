import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(color: Color(0xff075E54)),// cor de fundo
        padding: EdgeInsets.all(16),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch , // para o botao entrar ocupe todo o espaçamento da tela
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 32),
                  child: Image.asset(
                    "images/logo.png",
                    width: 200,
                    height: 150,
                  ),
                ), 
                Padding(
                  padding: EdgeInsets.only(bottom: 8),
                  child: TextField(
                    autofocus: true,
                    keyboardType: TextInputType.emailAddress,
                    style: TextStyle(fontSize: 20),
                    decoration: InputDecoration(
                     contentPadding: EdgeInsets.fromLTRB(32, 16, 32, 16), 
                     hintText: "e-mail",
                     filled: true, 
                     fillColor: Colors.white,
                     border: OutlineInputBorder( // linha externa
                       borderRadius: BorderRadius.circular(30)
                     ), 
                     ),
                     ),
                  ),
                  Padding(
                  padding: EdgeInsets.only(bottom: 8),
                  child: TextField(
                    autofocus: true,
                    keyboardType: TextInputType.text,
                    style: TextStyle(fontSize: 20),
                    decoration: InputDecoration(
                     contentPadding: EdgeInsets.fromLTRB(32, 16, 32, 16), 
                     hintText: "Senha",
                     filled: true, 
                     fillColor: Colors.white,
                     border: OutlineInputBorder( // linha externa
                      borderRadius: BorderRadius.circular(30)
                      ), 
                    ),
                  ),
                ),
                Padding( // botao entrar 
                  padding: EdgeInsets.only(top: 16, bottom: 10),
                  child: RaisedButton(
                    child: Text(
                      "Entrar",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      color: Colors.green, 
                      padding: EdgeInsets.fromLTRB(32, 16, 32, 16),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
                    onPressed: () {} ),
                    ),
                    Center(
                      child: GestureDetector(
                        child: Text(
                          "Não tem conta? Cadastre-se!", 
                          style: TextStyle(color: Colors.white)
                        ), 
                        onTap: (){// quando o usuario clicar em cima da tela cadastre-se, sera enviado a uma outra tela

                        }
                      )
                    )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
