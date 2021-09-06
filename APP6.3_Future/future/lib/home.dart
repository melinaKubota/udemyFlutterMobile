import 'dart:html';

import 'package:flutter/material.dart';
import 'package:future/post.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async'; //

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String _urlBase = "https://jsonplaceholder.typicode.com/";
  Uri uri = Uri(path: _urlBase);

  Future<List<Post>> _recuperarPostagens() async {
    http.Response response = await http.get(uri + "/posts");
    var dadosJason = jsonDecode(response.body);

    List<Post> postagens = List();
    for (var post in dadosJason) {
      print("post:" + post["title"]);
      Post p = Post(post["userId"], post["id"], post["title"], post["body"]);
      postagens.add(p);
    }

    return dadosJason;
  }

  _post() async {

    var corpo = jsonEncode({
      "userId":1, 
      "id":1, 
      "title", "", 
      "body":"",
      }
      );
    http.Response response = await http.post(
      uri + "/posts",
      headers: {"Content-type": "aplication/json; charset=UTF-8"},
      body: corpo
    );
  }

  _put() async{ //enviar o obejto inteiro para os dados serem atualizados
    var corpo = jsonEncode({
      "userId":120, 
      "id": null, // pq ele é gerado de forma automatica
      "title", "Titulo",
      "body":"Corpo da postagem",
      }
      );
      http.Response response = await http.put(uri + "/posts2",
      headers:{
        "Content-type": "application/json; charset=UFT-8"
      },
      body: corpo
      );
      
      )
  }
  _path() {// diferente do put, nao precisa enviar todos os dados

  }
  _delete() async{
    http.Response response = await http.delete(uri + "/posts/2");
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Consummo de serviço avançado"),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              children: [
                RaisedButton(
                  child: Text("Salvar"),
                  onPressed: _post,
                ),
                RaisedButton(
                  child: Text("Atualizar"),
                  onPressed: _put,
                ),
                RaisedButton(
                  child: Text("Remover"),
                  onPressed: _delete,
                ),
              ],
            ),
            Expanded(
              child: FutureBuilder<List<Post>>(
                future: _recuperarPostagens(),
                builder: (context, snapshot) {
                  // snapshot, dados que recuperei na requisição de uri
                  switch (snapshot.connectionState) {
                    // verifica o estado da conexão
                    case ConnectionState.none:
                    case ConnectionState.waiting:
                      return Center(
                        child:
                            CircularProgressIndicator(), //exibe barra de progresso
                      );
                      break;
                    case ConnectionState.active:
                    case ConnectionState.done:
                      if (snapshot.hasError) {
                      } else {
                        print("lista: carregou!!");
                        return ListView.builder(
                            itemCount: snapshot.data.length,
                            itemBuilder: (context, index) {
                              List<Post> lista = snapshot.data;
                              Post post = lista[index];

                              return ListTile(
                                title: Text(post.title),
                                subtitle: Text(post.id.toString()),
                              );
                            });
                      }
                      break;
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
