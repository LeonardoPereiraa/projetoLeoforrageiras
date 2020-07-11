import 'package:flutter/material.dart';
import 'dados.dart';
import 'main.dart';

class Resultado extends StatelessWidget {
  String resultado;
  Resultado(Dados dados,  List<DropdownMenuItem<List<int>>> saida){
  
    
    int coluna = saida[0].value[saida[0].value.length -1];
    this.resultado = dados.getElemento(saida[0].value[0], coluna);
    for(int i =1 ; i< saida.length;i++){
      resultado = resultado + ", "+ dados.getElemento(saida[i].value[0], coluna);
      
    }


  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        
        title: Text("Resultado"),
      ),
      body: Center(
        child: Text(this.resultado),
        
      ),
    );
  }
}