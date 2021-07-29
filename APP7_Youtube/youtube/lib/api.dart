import 'package:sky_engine/_http/http.dart' as http;
import 'dart:convert';

import 'package:youtube/model/video.dart';

const CHAVE_YOUTUBE_API = "AIzaSyA9xcv5Ny8vs7tQ8JLMgAHozRubk2v7Rh8";
const ID_CANAL = "F4WCRWP3XEI";
const URL_BASE = "https://www.googleapis.com/youtube/v3/";

class Api {
  Future<List<Video>> pesquisar(String pesquisa) async {
    http.HttpResponse response = await http.get(
        //http.Response response = await http.get(
        URL_BASE +
            "search"
                "?part=snippet" //no primeiro eu coloco? nos outros coloco &
                "&type=video"
                "&maxResults=20"
                "&order=date"
                "&key=$CHAVE_YOUTUBE_API"
                "&chanelId==$ID_CANAL"
                "&q=$pesquisa");
    if (response.statusCode == 200) {
      Map<String, dynamic> dadosJson = json.decode(response.body);

      List<Video> videos = dadosJson["items"].map<Video>((map) {
        return Video.fromJson(map);
      }).toList();

      return videos;

      /* for (var video in videos) {
        print("Resultado: " + video.titulo);
      } */

      /*for (var video in dadosJson["items"]) {
        print("Resultado: " + video.toString());
      }*/
      print(
          "Resultado: " + dadosJson["items"][0]["snippet"]["title"].toString());
    } else {}
  }
}
