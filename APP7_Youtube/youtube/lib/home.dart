import 'package:flutter/material.dart';

class Home extends StatefulWidget {

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData (color: Colors.grey, opacity: 1, ),
        backgroundColor: Colors.white,
        title: Image.asset("images/youtube.png", 
        width: 98,
        height: 22,
        ),
        actions: [
          IconButton(
              onPressed: () {
                print("acao: videocam");
              },
              icon: Icon(Icons.videocam)
            ),
            IconButton(
              onPressed: () {
                print("acao: pesquisa");
              },
              icon: Icon(Icons.search)
            ),
            IconButton(
              onPressed: () {
                print("acao: conta");
              },
              icon: Icon(Icons.account_circle)
            ),
        ],
      ),
      body: Container(),
    );
  }
}
