import 'package:esportes_flutter/Model/Times.dart';
import 'package:flutter/material.dart';

class TimesRepository{
  static List<Times> lista = [
    Times(icone: "images/icone_futebol.png", descricao: "Melhores times já vistos"),
    Times(icone: "images/icone_futebol_europa.png", descricao: "Melhores times europeus já vistos"),
    Times(icone: "images/cavalo_paraguai.png", descricao: "Cavalos paraguais do Brasil (atualizado)"),
    Times(icone: "images/treiandor.png", descricao: "Melhores treinadores"),
    Times(icone: "images/jogadores.jpg", descricao: "Melhores jogadores já vistos"),
  ];
}

