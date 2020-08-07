import 'package:flutter/material.dart';

import 'package:forrageiras/Forragueira.dart';
import 'package:forrageiras/Maneger.dart';
import 'package:forrageiras/SistemaCombobox.dart';

class ManageCombobox extends StatefulWidget {
  ManageCombobox({Key key}) : super(key: key);
  ManageComboboxState manageCombo;

  @override
  ManageComboboxState createState() { 
      this.manageCombo=ManageComboboxState();
      return this.manageCombo;
    }
  

}

class ManageComboboxState extends State<ManageCombobox> {
  int quantidadeJaEscolida;
  int quantidadeDeItem;
  Manager dadosManager;
  List<SistemaCombobox> meuCombobox ;


  ManageComboboxState(){
    quantidadeJaEscolida= 0;
    meuCombobox = List();
    dadosManager = new Manager();

    this.quantidadeDeItem=dadosManager.dadoEntrada.orden.length -1;
    for (int i=0; i<quantidadeDeItem; i=i+1){
      String nome = dadosManager.dadoEntrada.orden[i];
      meuCombobox.add(SistemaCombobox(this,dadosManager.opcoesForragueras[0][nome],nome));
    }
  }
  void SReset(){
    setState(() {
      
    
    this.quantidadeJaEscolida= 0;
    this.meuCombobox = List();
    this.dadosManager = new Manager();

    this.quantidadeDeItem=dadosManager.dadoEntrada.orden.length -1;
    for (int i=0; i<quantidadeDeItem; i=i+1){
      String nome = dadosManager.dadoEntrada.orden[i];
      meuCombobox.add(SistemaCombobox(this,dadosManager.opcoesForragueras[0][nome],nome));
    }
    this.quantidadeJaEscolida= 0;
    });
  }



  @override
  Widget build(BuildContext context) {
    return Flexible(
        child: new ListView.builder(
            padding: const EdgeInsets.only(left: 60.0 , top: 15.0 ,right: 60.0 , bottom: 15.0),
            itemCount: this.quantidadeDeItem, itemBuilder: (BuildContext context, int index) {
              return meuCombobox[index].menuDropdonw(); 
            }));
  }

  
  void ChangeCombobox(Forragueira escolha, SistemaCombobox box){
     
    int posicaoDaEscolha = this.meuCombobox.indexOf(box);
    
    
    
    if(quantidadeJaEscolida <= posicaoDaEscolha){
      SistemaCombobox boxalciliar = this.meuCombobox[quantidadeJaEscolida];
      
      setState(() {
        box.currentCity = escolha;
        this.meuCombobox[quantidadeJaEscolida]= box;
        this.meuCombobox[posicaoDaEscolha]=boxalciliar;
        
        this.dadosManager.atulizarSistema(escolha);
        

      });
      atualizarCombobox();
        this.quantidadeJaEscolida++;
     

      for(int i =this.quantidadeJaEscolida;i< this.meuCombobox.length;i++ ){
        if(this.meuCombobox[i].escolherElementoUnico()){
          i=this.meuCombobox.length;
        }
      }
    }
    else{
     this.dadosManager.voltarEstado(posicaoDaEscolha);
     this.quantidadeJaEscolida=posicaoDaEscolha;
      atualizarCombobox();
     
     ChangeCombobox(escolha, box);
     
    }
    

    

  }

  void atualizarCombobox(){
    setState(() {
    for(int i =quantidadeJaEscolida+1;i<meuCombobox.length;i++){
    
      meuCombobox[i].atualizar(this.dadosManager.opcoesForragueras.last[meuCombobox[i].nomeCombobox]);

    }
    });


  }

  String cultivoDeSaida(){
    return this.dadosManager.opcoesForragueras.last["CULTIVAR"][0].tipo;
  }






}
