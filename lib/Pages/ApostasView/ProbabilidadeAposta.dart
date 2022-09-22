import 'package:flutter/material.dart';

import '../../Model/Apostas.dart';
import '../../Repository/apostas_repository.dart';
import 'package:provider/provider.dart';

class ProbabilidadeApostaPage extends StatefulWidget {

  @override
  State<ProbabilidadeApostaPage> createState() => _ProbabilidadeApostaPageState();
}

class _ProbabilidadeApostaPageState extends State<ProbabilidadeApostaPage> {
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
    return Scaffold(
      appBar: AppBar(
        title: Text("Probabilidade de vitória"),
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
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                             Image.asset(apostas[opcao].escudoCasa, width: 50, height: 50,),
                            Slider(
                              value: apostas[opcao].probabilidadeVitoriaCasa,
                              min: 0,
                              max: 100,
                              label: "Valor selecionado: " + apostas[opcao].probabilidadeVitoriaCasa.toString(),
                              divisions: 10,
                              activeColor: apostas[opcao].probabilidadeVitoriaCasa > apostas[opcao].probabilidadeVitoriaVisitante ? Colors.green : Colors.red,
                              inactiveColor: Colors.black26,
                              onChanged: ( valor){
                              },
                            ),
                          ],
                        ),

                        Row(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(apostas[opcao].escudoVisitante,  width: 50, height: 50,),
                            Slider(
                              value: apostas[opcao].probabilidadeVitoriaVisitante,
                              min: 0,
                              max: 100,
                              label: "Valor selecionado: " + apostas[opcao].probabilidadeVitoriaVisitante.toString(),
                              divisions: 10,
                              activeColor: apostas[opcao].probabilidadeVitoriaVisitante > apostas[opcao].probabilidadeVitoriaCasa ? Colors.green : Colors.red,
                              inactiveColor: Colors.black26,
                              onChanged: ( valor){
                                setState(() {
                                  apostas[opcao].probabilidadeVitoriaVisitante = valor.toDouble();
                                });
                              },
                            ),
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
