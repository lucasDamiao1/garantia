

import 'package:esportes_flutter/Model/Saldo.dart';
import 'package:flutter/material.dart';

class SaldoRepository{
  static List<Saldo> saldo = [
    Saldo(timeCasa: "Palmeiras", timeVisitante: "Santos", saldo: 1000.00, dateJogo: "13/07/2022", escudoCasa: "images/times_brasil/palmeiras.png", escudoVisitante: "images/times_brasil/santos.png", timeEscolhido: "images/times_brasil/palmeiras.png"),
    Saldo(timeCasa: "Vasco", timeVisitante: "Coritiba", saldo: -100.00, dateJogo: "19/07/2022", escudoCasa: "images/times_brasil/vasco.png", escudoVisitante: "images/times_brasil/coritiba.png", timeEscolhido: "images/times_brasil/vasco.png"),


  ];



}