
import 'package:flutter/material.dart';import '../Model/News.dart';
import '../Repository/news_repository.dart';
import 'package:provider/provider.dart';
import '../Repository/times_repository.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class NewsPage extends StatefulWidget {

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  late List<News> tabelaNoticias;
  late NewsRepository newsRepository;
  dynamic busca = '';

  @override
  void initState() {
    super.initState();
    context.read<NewsRepository>().setNewsSports();
  }

  @override
  Widget build(BuildContext context) {
    print("Buildou");
    newsRepository  =  context.watch<NewsRepository>();
    tabelaNoticias = newsRepository.newsData;
    TextEditingController _textEditingController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: TextField(
          keyboardType: TextInputType.datetime,
          decoration: InputDecoration(
            labelText: "Busca por data"
          ),
          controller: _textEditingController ,
        ),
        centerTitle: true,
        actions: [
          ElevatedButton(
              onPressed: (){
                setState(() {
                  busca = _textEditingController.text;
                });
              },
              child: Icon(Icons.search, color: Colors.black,),
          )
        ],
        backgroundColor: Colors.white,
      ),

      body: ListView.separated(
          itemBuilder: (BuildContext context, int opcao){
              return Card(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(padding: EdgeInsets.all(10)),
                    ListTile(
                      leading: Icon(Icons.newspaper),
                      title: Text(
                        tabelaNoticias[opcao].title,
                        style:
                        TextStyle(
                            fontSize: 15
                        ),
                      ),
                    ),
                    Padding(padding: EdgeInsets.all(10),
                        child: Text(tabelaNoticias[opcao].date)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                            onPressed: () {},
                            child: Text("Ver"))
                      ],
                    )
                  ],
                ),
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: const BorderRadius.all(Radius.circular(12)),
                ),color: (busca.length > 0 && tabelaNoticias[opcao].date.toString() == busca ) ? Colors.indigo : Colors.white,
              );
          },
          padding: EdgeInsets.all(20),
          separatorBuilder: (_,__) => Divider(),
          itemCount: tabelaNoticias.length
      ),
    );
  }
}
