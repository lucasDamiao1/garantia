
import 'package:esportes_flutter/Model/Apostas.dart';
import 'package:esportes_flutter/Pages/App.dart';
import 'package:esportes_flutter/Repository/apostas_repository.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class JogosApostas extends StatefulWidget {

  @override
  State<JogosApostas> createState() => _JogosApostasState();
}

class _JogosApostasState extends State<JogosApostas> {
  late ApostasRepository apostasRepository;
  late List<Apostas> apostas;

  @override
  void initState(){
    super.initState();
    context.read<ApostasRepository>().setApostas();
  }

  @override
  Widget build(BuildContext context) {
    apostasRepository  =  context.watch<ApostasRepository>();
    apostas = apostasRepository.confrontosTimes;

    print(apostas);
    TextEditingController _textEditingController = TextEditingController();
    return  Scaffold(
      appBar: AppBar(
        title: Text("Apostas"),
      ),
      body: ListView.separated(
          itemBuilder: (BuildContext context, int opcao){
            return Card(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    child: Column(
                      children: [
                          Padding(padding: EdgeInsets.all(10)),
                          ListTile(
                            title: Text(
                                apostas[opcao].timeCasa +  " vs " + apostas[opcao].timeVisitante,
                                style:
                                TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold
                                ),
                                textAlign: TextAlign.center
                            ),
                            subtitle: Text(apostas[opcao].dateJogo, textAlign: TextAlign.center),
                          ),
                          Padding(padding: EdgeInsets.all(10),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Padding(padding: EdgeInsets.all(10) , child: Image.asset(apostas[opcao].escudoCasa, width: 50, height: 50,),),
                                  Text(" VS "),
                                  Padding(padding: EdgeInsets.all(10), child:  Image.asset(apostas[opcao].escudoVisitante,  width: 50, height: 50,),),
                                ],
                              )
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              TextButton(
                                  onPressed: (){
                                    setState(() {
                                      if(apostas[opcao].favoritar){
                                        apostas[opcao].favoritar = false;
                                      }else{
                                        apostas[opcao].favoritar = true;
                                      }
                                    });
                                  },
                                  child: Icon(apostas[opcao].favoritar ? Icons.star : Icons.star_outline_rounded)
                              )
                            ],
                          ),
                      ],
                    ),
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(222, 222, 233, 0.4),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromRGBO(222, 222, 233, 0.4),
                          blurRadius: 25.0,
                          spreadRadius: 2,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              elevation: 0,
            );
          },
          padding: EdgeInsets.all(20),
          separatorBuilder: (_,__) => Divider(),
          itemCount: apostas.length
      ),
    );
  }
}
