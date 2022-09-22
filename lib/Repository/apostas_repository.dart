import 'package:esportes_flutter/Model/Bandeiras.dart';
import 'package:esportes_flutter/Model/News.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../Model/Apostas.dart';
import 'bandeiras_repository.dart';

class ApostasRepository extends ChangeNotifier{
  static List <Apostas> tabelaApostas = [];
  List<Apostas> get confrontosTimes  => tabelaApostas;

  ApostasRepository(){
    print("Chegou aqui");
    setApostas();
  }

  setApostas() async {
    var index = 0;
    tabelaApostas = [];
    //Criar nova model
    //Salvar selecao de bandeiras para percorrer aqui

    List<Bandeiras> tabelaBandeira =  BandeirasRepository.bandeiras;
    for (var value in tabelaBandeira){
      switch(value.nome ){
        case "Alemanha":
          if(value.escolha){
            setConfrontosAlemanha();
          }
          break;
        case "Espanha":
          if(value.escolha){
            setConfrontosEspanha();
          }
          break;
        case "Franca":
          if(value.escolha){
            setConfrontosFranca();
          }
          break;
        case "Italia":
          if(value.escolha){
            setConfrontosItalia();
          }
          break;
        case "Brasil":
          if(value.escolha) {
            setConfrontosBrasil();
          }
          break;
      }
    }
  }

  void setConfrontosAlemanha(){
    tabelaApostas += [
      Apostas(timeCasa: "Bayern Mun", timeVisitante: "Borussia", probabilidadeVitoriaCasa: 70.0, probabilidadeVitoriaVisitante: 10.0, dateJogo: "18/09/2022", escudoCasa: "images/times_alemanha/bayern.png", escudoVisitante: "images/times_alemanha/Borussia_Dortmund_logo.png", favoritar: false),
    ];
  }

  void setConfrontosEspanha(){
    tabelaApostas += [
      Apostas(timeCasa: "Barcelona", timeVisitante: "Real Madrid", probabilidadeVitoriaCasa: 50.0, probabilidadeVitoriaVisitante: 50.0, dateJogo: "25/09/2022", escudoCasa: "images/times_espanha/FCBarcelona.png", escudoVisitante: "images/times_espanha/Real_Madrid.png", favoritar: false),
      Apostas(timeCasa: "Real Madrida", timeVisitante: "Barcelona", probabilidadeVitoriaCasa: 70.0, probabilidadeVitoriaVisitante: 40.0, dateJogo: "30/09/2022", escudoCasa: "images/times_espanha/Real_Madrid.png", escudoVisitante: "images/times_espanha/FCBarcelona.png", favoritar: false),
    ];
  }

  void setConfrontosFranca(){
    tabelaApostas += [
      Apostas(timeCasa: "Psg", timeVisitante: "Monacp", probabilidadeVitoriaCasa: 90.0, probabilidadeVitoriaVisitante: 5.0, dateJogo: "25/09/2022", escudoCasa: "images/times_franca/PSG.jpg", escudoVisitante: "images/times_franca/monaco.png", favoritar: false),
    ];
  }

  void setConfrontosItalia(){
    tabelaApostas += [
      Apostas(timeCasa: "Juventus", timeVisitante: "Milan", probabilidadeVitoriaCasa: 60.0, probabilidadeVitoriaVisitante: 50.0, dateJogo: "25/09/2022", escudoCasa: "images/times_italia/Juventus.png", escudoVisitante: "images/times_italia/Milan.png", favoritar: false),
    ];
  }

  void setConfrontosBrasil(){
    tabelaApostas += [
      Apostas(timeCasa: "Palmeiras", timeVisitante: "Corinthians", probabilidadeVitoriaCasa: 90.0, probabilidadeVitoriaVisitante: 5.0, dateJogo: "25/09/2022", escudoCasa: "images/times_brasil/palmeiras.png", escudoVisitante: "images/times_brasil/Corinthians.png", favoritar: false),
      Apostas(timeCasa: "Vasco", timeVisitante: "Corinthians", probabilidadeVitoriaCasa: 90.0, probabilidadeVitoriaVisitante: 3.0, dateJogo: "28/09/2022", escudoCasa: "images/times_brasil/vasco.png", escudoVisitante: "images/times_brasil/Corinthians.png", favoritar: false),
      Apostas(timeCasa: "Coritiba", timeVisitante: "Parana", probabilidadeVitoriaCasa: 10.0, probabilidadeVitoriaVisitante: 10.0, dateJogo: "28/09/2022", escudoCasa: "images/times_brasil/coritiba.png", escudoVisitante: "images/times_brasil/parana.png", favoritar: false),
      Apostas(timeCasa: "Santos", timeVisitante: "Palmeiras", probabilidadeVitoriaCasa: 10.0, probabilidadeVitoriaVisitante: 90.0, dateJogo: "28/09/2022", escudoCasa: "images/times_brasil/santos.png", escudoVisitante: "images/times_brasil/palmeiras.png", favoritar: false),
    ];

  }


}