import 'package:flutter/material.dart';

class ApostasView extends StatefulWidget {

  @override
  State<ApostasView> createState() => _ApostasViewState();
}

class _ApostasViewState extends State<ApostasView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(padding: EdgeInsets.all(10) , child:  CardApostas(),),
          Padding(padding: EdgeInsets.all(10) , child:  CardProbabilidade(),),
          Padding(padding: EdgeInsets.all(10) , child:  CardMeuLance(),),


        ],
      ),
    );
  }
}

class CardApostas extends StatefulWidget {

  @override
  State<CardApostas> createState() => _CardApostasState();
}

class _CardApostasState extends State<CardApostas> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              title: Padding(padding: EdgeInsets.all(10),child : Text("Jogos para apostar", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),)),
              subtitle: Padding(padding: EdgeInsets.all(10), child: Text("Visualizar jogos que acontecerão e realizar aposta nos placares",),),
            ),
            Padding(padding: EdgeInsets.all(10)),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextButton(
                    onPressed: (){
                      Navigator.pushNamed(context, "/jogosapostas");
                    },
                    child: Text("Visualizar" ),
                )
              ],

            )
          ],
        )
      ),
    );
  }
}

class CardProbabilidade extends StatefulWidget {

  @override
  State<CardProbabilidade> createState() => _CardProbabilidadeState();
}

class _CardProbabilidadeState extends State<CardProbabilidade> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: Padding(padding: EdgeInsets.all(10),child : Text("Probabilidade dos jogos", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),)),
                subtitle: Padding(padding: EdgeInsets.all(10), child: Text("Visualizar estatistica de vitória de cada time em sua rodada",),),
              ),
              Padding(padding: EdgeInsets.all(10)),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextButton(
                    onPressed: (){
                      Navigator.pushNamed(context, "/probabilidadeaposta");
                    },
                    child: Text("Visualizar" ),
                  )
                ],

              )
            ],
          )
      ),
    );
  }

}

class CardMeuLance extends StatefulWidget {

  @override
  State<CardMeuLance> createState() => _CardMeuLanceState();
}

class _CardMeuLanceState extends State<CardMeuLance> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: Padding(padding: EdgeInsets.all(10),child : Text("Minhas apostas", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),)),
                subtitle: Padding(padding: EdgeInsets.all(10), child: Text("Visualizar minhas apostas realizadas",),),
              ),
              Padding(padding: EdgeInsets.all(10)),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextButton(
                    onPressed: (){},
                    child: Text("Visualizar" ),
                  )
                ],

              )
            ],
          )
      ),
    );
  }

}


