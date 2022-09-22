
import 'package:esportes_flutter/Model/Bandeiras.dart';
import 'package:flutter/material.dart';
import '../../Repository/bandeiras_repository.dart';

class PaisesView extends StatefulWidget {
  const PaisesView({Key? key}) : super(key: key);

  @override
  State<PaisesView> createState() => _PaisesViewState();
}

class _PaisesViewState extends State<PaisesView> {
  @override
  var _pais = false;
  Widget build(BuildContext context) {
   List<Bandeiras> tabelaBandeira =  BandeirasRepository.bandeiras;
    return Scaffold(
      appBar: AppBar(
        title: Text("Selecione o país que acompanhar seus jogos"),
      ),
      body: ListView.separated(
          itemBuilder: (BuildContext context, int opcao){
            return Column(
              children: [
                CheckboxListTile(
                    title: Text(tabelaBandeira[opcao].nome),
                    subtitle: Text("País escolhido"),
                    activeColor: Colors.black38,
                    secondary: Image.asset(tabelaBandeira[opcao].bandeira),
                    selected: tabelaBandeira[opcao].escolha,
                    value:  tabelaBandeira[opcao].escolha,
                    onChanged: (valor){
                      setState(() {
                        print( tabelaBandeira[opcao]);
                        tabelaBandeira[opcao].escolha = valor!;
                      });
                    }
                ),
              ],
            );
          },
          padding: EdgeInsets.all(20),
          separatorBuilder: (_,__) => Divider(),
          itemCount: tabelaBandeira.length,
      ),
    );
  }
}
