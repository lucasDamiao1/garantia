import 'package:esportes_flutter/Model/News.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class NewsRepository extends ChangeNotifier{
  List<News> dataNews = [];
  List<News> get newsData  => dataNews;

  NewsRepository() {
    setNewsSports();
  }

  setNewsSports() async {
    var URL = "https://apinoticias.tedk.com.br/api/?q=futebol&date=17/09/2022";

    http.Response response = await http.get(URL);
    Map<dynamic, dynamic> retorno = json.decode(response.body);
    List<dynamic> results = retorno['list'];

    results.forEach((value) {
      dataNews.add(News(title: value['title'], description:  value['description'], link: value['link'], datetime:  value['datetime'], date:  value['date'], time:  value['time:']));
    });

  }
}
