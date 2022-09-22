import 'package:esportes_flutter/Pages/ConfiguracaoPage.dart';
import 'package:esportes_flutter/Pages/HomePage.dart';
import 'package:esportes_flutter/Pages/LucrosPage.dart';
import 'package:esportes_flutter/Pages/NewsPage.dart';
import 'package:flutter/material.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';

import 'ApostasView/ApostasView.dart';
import 'TimePageList.dart';

class App extends StatefulWidget {

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {

  int pageA = 1;
  late PageController _controllerPage;

  void initState(){
    super.initState();
    _controllerPage = PageController(initialPage: pageA);
  }

  void _setPage(int pagina){
    setState(() {
      pageA = pagina;
    });
  }

  setPaisSelecao(context){
    //Maneira de fazer rota
    Navigator.pushNamed(context, "/paisesselecao");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading:
        IconButton(onPressed: (){}, icon: Icon(Icons.star)),
        actions: [
          IconButton(onPressed: (){setPaisSelecao(context);},icon: Icon(Icons.language),),
          IconButton(onPressed: (){}, icon: Icon(Icons.settings))
        ],
        title: Text("EsportsNet"),
        centerTitle: true,
      ),
      body: PageView(
        controller: _controllerPage,
        children: [
          NewsPage(),
          HomePage(),
          LucrosPage(),
          ApostasView(),
        ],
        onPageChanged: _setPage,
      ),
      //APP BAR
      bottomNavigationBar: BottomNavyBar(
        selectedIndex: pageA,
        showElevation: true,
        items: [
          BottomNavyBarItem(icon: Icon(Icons.newspaper), title: Text('Noticías'), activeColor: Colors.blueGrey),
          BottomNavyBarItem(icon: Icon(Icons.home), title: Text('Home'), activeColor: Colors.green),
          BottomNavyBarItem(icon: Icon(Icons.analytics_outlined), title: Text('Ganhos'), activeColor: Colors.purple),
          BottomNavyBarItem(icon: Icon(Icons.monetization_on_outlined), title: Text('Jogos'), activeColor: Colors.lightGreen),
        ],
        onItemSelected: (pagina){
          _controllerPage.animateToPage(pagina, duration: Duration(milliseconds: 300), curve: Curves.ease);
        },
      ),
    );
  }
}
