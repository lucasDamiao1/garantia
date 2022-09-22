import 'package:esportes_flutter/Model/Times.dart';
import 'package:flutter/material.dart';

import '../Repository/times_repository.dart';

class ListTimes extends StatefulWidget {

  @override
  State<ListTimes> createState() => _ListTimesState();
}

class _ListTimesState extends State<ListTimes> {
  @override
  Widget build(BuildContext context) {
    final tabelaOpcao = TimesRepository.lista;
    return Scaffold(
      appBar: AppBar(
        title: Text("Lista de times"),
        centerTitle: true,
      ),
      body: ListView.separated(
          itemBuilder: (BuildContext context, int opcao){
            return ListTile(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10))
              ),
              leading: SizedBox(
                child: Image.asset(tabelaOpcao[opcao].icone),
                width: 30,
              ),
              title: Text(tabelaOpcao[opcao].descricao),
            );
          }, 
          padding: EdgeInsets.all(20),
          separatorBuilder: (_,__) => Divider(),
          itemCount: tabelaOpcao.length
      ),
    );
  }
}
