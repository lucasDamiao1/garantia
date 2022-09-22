import 'package:flutter/material.dart';

class Apostas {
  String timeCasa;
  String timeVisitante;
  double probabilidadeVitoriaCasa;
  double probabilidadeVitoriaVisitante;
  dynamic dateJogo;
  String escudoCasa;
  String escudoVisitante;
  bool favoritar;

  Apostas({
    required this.timeCasa,
    required this.timeVisitante,
    required this.probabilidadeVitoriaCasa,
    required this.probabilidadeVitoriaVisitante,
    required this.dateJogo,
    required this.escudoCasa,
    required this.escudoVisitante,
    required this.favoritar,
  });
}
