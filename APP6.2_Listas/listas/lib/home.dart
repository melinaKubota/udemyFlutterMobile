import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List _itens = [];
  void _carregarItens() {
    _itens = [];
    for (int i = 0; i <= 10; i++) {
      Map<String, dynamic> item = Map();
      item["titulo"] = "Titulo ${i} Lorem ipsum dolor sit amet.";
      item["descricao"] = "Descrição ${i} Lorem ipsum dolor sit amet.";
      _itens.add(item);
    }
  }

  @override
  Widget build(BuildContext context) {
    _carregarItens();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Lista",
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(
          20,
        ),
        child: ListView.builder(
          //listar itens
          itemCount: _itens.length, //numero de itens para aparecer
          itemBuilder: (
            context,
            indice,
          ) {
            return ListTile(
              onTap: () {
                //quando clicar
                showDialog(
                    //exibe um dialog
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        //alert no app
                        title: Text(_itens[indice]["titulo"]),
                        titlePadding: EdgeInsets.all(20),
                        titleTextStyle: TextStyle(
                          fontSize: 20,
                          color: Colors.orange,
                        ),
                        content: Text(_itens[indice]["descricao"]),
                        contentPadding: EdgeInsets.all(70),
                        contentTextStyle: TextStyle(
                          fontSize: 15,
                          color: Colors.blue,
                        ),
                        backgroundColor: Colors.green,
                        actions: [
                          FlatButton(
                            onPressed: () {
                              Navigator.pop(
                                  context); // para quando clicar em sim ele fechar o alert
                            },
                            child: Text("Sim"),
                          ),
                          FlatButton(
                            onPressed: () {
                              Navigator.pop(
                                  context); // para quando clicar em sim ele fechar o alert
                            },
                            child: Text("Não"),
                          ),
                        ],
                      );
                    });
              },
              /* onLongPress: (){ //quando clicar por um longo tempo

               }, */
              title: Text(
                _itens[indice]["titulo"],
              ),
              subtitle: Text(
                _itens[indice]["descricao"],
              ),
            );
          },
        ),
      ),
    );
  }
}
