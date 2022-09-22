import 'package:flutter/material.dart';

import '../../Model/Saldo.dart';
import '../../Repository/saldo_repository.dart';
class DetalhamentoPage extends StatefulWidget {

  @override
  State<DetalhamentoPage> createState() => _DetalhamentoPageState();
}

class _DetalhamentoPageState extends State<DetalhamentoPage> {
  @override
  List<Saldo> saldoR =  SaldoRepository.saldo;
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detalhamento apostas"),
      ),
      body:  ListView.separated(
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
                              saldoR[opcao].timeCasa +  " vs " + saldoR[opcao].timeVisitante,
                              style:
                              TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold
                              ),
                              textAlign: TextAlign.center
                          ),
                          subtitle: Text(saldoR[opcao].dateJogo, textAlign: TextAlign.center),
                        ),
                        Padding(padding: EdgeInsets.all(10),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(" Time escolhido "),
                                Padding(padding: EdgeInsets.all(10) , child: Image.asset(saldoR[opcao].timeEscolhido, width: 50, height: 50,),),
                              ],
                            )
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              (saldoR[opcao].saldo > 0 ? "+" + saldoR[opcao].saldo.toString() : "-"+saldoR[opcao].saldo.toString()),
                              style: TextStyle(
                                color: (saldoR[opcao].saldo > 0 ? Colors.green : Colors.red)
                              ),
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
          itemCount: saldoR.length
      ),
    );
  }
}
