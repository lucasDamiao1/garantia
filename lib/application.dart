import 'package:esportes_flutter/Pages/App.dart';
import 'package:esportes_flutter/Pages/PagesPais/PaisesView.dart';
import 'package:esportes_flutter/Pages/ApostasView/JogosAposta.dart';
import 'package:flutter/material.dart';

import 'Pages/ApostasView/ProbabilidadeAposta.dart';
import 'Pages/Detalhamento/Detalhamento.dart';
class AplicationStart extends StatefulWidget {

  @override
  State<AplicationStart> createState() => _AplicationStartState();
}

class _AplicationStartState extends State<AplicationStart> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Esportes App",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: App(),
      initialRoute: "/",
      routes: {
        "/paisesselecao": (context) => PaisesView(),
        "/jogosapostas": (context) => JogosApostas(),
        "/probabilidadeaposta": (context) => ProbabilidadeApostaPage(),
        "/detalhamento": (context) => DetalhamentoPage(),
      },
    );
  }
}
