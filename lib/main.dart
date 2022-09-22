
import 'package:esportes_flutter/Repository/apostas_repository.dart';
import 'package:esportes_flutter/Repository/news_repository.dart';
import 'package:flutter/material.dart';
import 'application.dart';
import 'package:provider/provider.dart';

void main() {
  runApp( MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (context) => NewsRepository(),
          lazy: false,
        ),
        ChangeNotifierProvider(
          create: (context) => ApostasRepository(),
          lazy: false,
        ),
      ],
    child: AplicationStart(),
  )
  );
}
