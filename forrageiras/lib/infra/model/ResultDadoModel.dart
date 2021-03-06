import 'dart:convert';
import 'package:forrageiras/domain/entities/Dado.dart';

class ResultDadoModel extends Dado {
  List<List<String>> lista= new List();
  List<String> orden=new List();

  void fromMap(Map<String,dynamic> map){
    _carregarKeyList(map);
    _carregaList(map);


  }
  void fromJson(String value){
    fromMap(json.decode(value));
  }


void _carregarKeyList(Map< String, dynamic> data){

	for(String a in data["lista"][0].keys ){
		this.orden.add(a);
	}
  
}

void _carregaList(Map< String, dynamic> data){
  List<String> novaLista; 
  print(data["lista"].length);
  for(int i=0 ; i < data["lista"].length; i++){
    novaLista=List();
    for(int p=0 ; p < this.orden.length; p++){
      novaLista.add(data["lista"][i][this.orden[p]]);
    }
   // print( novaLista);
    this.lista.add(novaLista);
  }
}
}