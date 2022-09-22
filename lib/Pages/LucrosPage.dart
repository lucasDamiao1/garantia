import 'package:esportes_flutter/Model/Saldo.dart';
import 'package:esportes_flutter/Repository/saldo_repository.dart';
import 'package:flutter/material.dart';
class LucrosPage extends StatefulWidget {

  @override
  State<LucrosPage> createState() => _LucrosPageState();
}

class _LucrosPageState extends State<LucrosPage> {
  @override
  Widget build(BuildContext context) {
    List<Saldo> saldoR =  SaldoRepository.saldo;
    dynamic saldo = 0;
    for(var valor in saldoR){
      saldo += valor.saldo;
    }

    return Scaffold(
      body: Center(
        child: Container(
          alignment: Alignment.center,
          child: Card(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                    padding: EdgeInsets.all(10),
                  child: Text(
                    "SUA CARTEIRA",
                    style: TextStyle(
                      fontFamily: 'BungeeInline',
                      fontSize: 40,
                      color: Colors.purple
                    ),
                  ),
                ),
                Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(20),
                      child: Text("SALDO:    " +  (saldo > 0 ? "+"+ saldo.toString() : "-"+ saldo.toString()), style: TextStyle(fontFamily: 'Michroma', fontSize: 20 ),),),
                    Padding( padding: EdgeInsets.all(20),),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                        onPressed: (){
                          Navigator.pushNamed(context, "/detalhamento");
                        },
                        child: Icon(Icons.account_balance_wallet),
                    )
                  ],
                )
              ],
            ),
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    );
  }
}
