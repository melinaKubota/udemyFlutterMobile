import 'package:flutter/material.dart';
import 'package:youtube/model/Video.dart';

import '../api.dart';

class Inicio extends StatefulWidget {
  @override
  _InicioState createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  _ListarVideos() async {
    Api api = Api();
    return api.pesquisar("");
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Video>>(
        future: _ListarVideos(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
              return Center(
                child: CircularProgressIndicator(),
              );
              break;
            case ConnectionState.active:
            case ConnectionState.done:
              if (snapshot.hasData) {
                return ListView.separated(
                  itemBuilder: (context, index){
                    List<Video> videos = snapshot.data;
                    Video video = videos[
                      index
                    ];
                    return Column (
                      children: [
                       Container(
                         height: 200,
                         decoration: BoxDecoration(
                           image: DecorationImage(
                             fit: BoxFit.cover,
                             image: NetworkImage(video.imagem)
                         ),
                       ),
                       ListTile(
                         title: Text(video.titulo),
                         subtitle: Text(video.descricao),
                         )
                      ],
                    );
                  },
                  separatorBuilder: (context, index) => Divider (
                    height: 2,
                    color: Colors.grey, 
                  ), 
                  itemCount: snapshot.data.hashCode //length
                ); 
              } else {
                return Center(
                  child: Text("Nenhum dado a ser exibido!"),
                );
              }
              break;
          }
        });
  }
}

/* import 'package:flutter/material.dart';
import 'package:youtube/api.dart';
import 'package:youtube/model/Video.dart';

class Inicio extends StatefulWidget {
  @override
  _InicioState createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  get videos => null;

  _listarVideos() {
    Api api = Api();
    return api.pesquisar("");
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Video>>(
        future: _listarVideos(),
        builder: (contex, snapshot){
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
              return Center(
                child: CircularProgressIndicator(),
              );
              break;
            case ConnectionState.active:
            case ConnectionState.done:
              if (snapshot.hasData) {
                var listView = ListView.separated(
                    itemBuilder: (context, index) {
                      List<Video>? videos = snapshot.data;
                      Video video = videos![index];
                      return Column(
                        children: [
                          Container(
                              height: 200,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: NetworkImage(video.imagem)))),
                          ListTile(
                            title: Text(video.titulo),
                            subtitle: Text(video.canal),
                          )
                        ],
                      );
                    },
                    separatorBuilder: (context, index) => Divider(
                          height: 3,
                          color: Colors.red,
                        ),
                    itemCount: snapshot.data!.length);
                return listView;
              } else {
                return Center(
                  child: Text("Nenhum dado a ser exibido!"),
                );
              }
            case ConnectionState.none:
          }
        }
    );
  }
}
 */