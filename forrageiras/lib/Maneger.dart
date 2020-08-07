import 'package:flutter/material.dart';
import 'package:forrageiras/Dado.dart';
import 'package:forrageiras/Fazenda.dart';
import 'package:forrageiras/Forragueira.dart';

class Manager{
  
  Dado dadoEntrada;
  List<List<Fazenda>> possiveveisFazendas= List();
  List<Map<String,List<Forragueira>>> opcoesForragueras=List();
  //List<String> forraguerasPossibilidade;
  List<List<int>> escolido= List(); 
  Manager(){

    this.dadoEntrada =new Dado();
    inicializarListafazendas();
    inicializarListaForragueras();
    this.escolido.add(criaListaDeZero(dadoEntrada.orden.length));
  }

  void inicializarListaForragueras(){

    this.opcoesForragueras.add(Map());
    for(int i =0;i<dadoEntrada.orden.length;i++){
      this.opcoesForragueras[0][dadoEntrada.orden[i]]=List();
      addElenetosIniciaisForragueiras(this.dadoEntrada.orden[i]);   
    }
  }

  void inicializarListafazendas(){
    possiveveisFazendas.add(List());
    for(int i =0;i<this.dadoEntrada.lista.length;i++){
      possiveveisFazendas[0].add(Fazenda(i));

    }
  }

  void addElenetosIniciaisForragueiras(String key){
    bool encontrado =false;
    int posicaoDado = dadoEntrada.orden.indexOf(key);
    for(int i =0;i<this.dadoEntrada.lista.length;i++){
      
      for(int p = 0; p<this.opcoesForragueras[0][key].length;p++){
        
        if(this.opcoesForragueras[0][key][p].verificarTipo(dadoEntrada.lista[i][posicaoDado])){
          this.opcoesForragueras[0][key][p].addFazenda(this.possiveveisFazendas[0][i]);
          encontrado = true;  
        }
        

      }
      if(!encontrado){
        
        this.opcoesForragueras[0][key].add(new Forragueira(key,dadoEntrada.lista[i][posicaoDado],possiveveisFazendas[0][i]));
        
      }
      encontrado=false;
    
    }
  }
  void atulizarSistema(Forragueira entrada){
    
    atualizarListfazenda(entrada.fazendas);
    this.escolido.add(copiaListaEscolida(this.escolido.last));
    this.escolido.last[this.dadoEntrada.orden.indexOf(entrada.categoria)]=1;
    
    atualizarListForragueira();
    

  }
  void atualizarListfazenda(List<Fazenda> fazenda){
    this.possiveveisFazendas.add(pertenceFazenda(this.possiveveisFazendas.last, fazenda));  
    

  }
  
  List<Fazenda> pertenceFazenda(List<Fazenda> fazenda1,List<Fazenda> fazenda2){
    List<Fazenda> pertence=List();
    for(int i =0;i<fazenda1.length;i++){
      if(fazenda2.indexOf(fazenda1[i])!= -1){
        pertence.add(fazenda1[i]);

      }


    }
    return pertence;

  }
  void atualizarListForragueira(){
    Map<String,List<Forragueira>> novaOpcoesForragueras=Map();
    for(int i =0;i<this.escolido.last.length;i++){
      if(this.escolido.last[i]==1){
        // vc copia a forragueira anterior
        novaOpcoesForragueras[this.dadoEntrada.orden[i]] = this.opcoesForragueras.last[this.dadoEntrada.orden[i]];
        
      }
      else{
        novaOpcoesForragueras[this.dadoEntrada.orden[i]]=forragueiraPertenceFazenda(this.opcoesForragueras.last[this.dadoEntrada.orden[i]],this.possiveveisFazendas.last);

        // use a fução forragueira PerteceFazenda;
      }

    }
    this.opcoesForragueras.add(novaOpcoesForragueras);

  }
  List<Forragueira> forragueiraPertenceFazenda(List<Forragueira> forragueira, List<Fazenda> fazenda){
    List<Forragueira> pertence = List(); 
    for(int i=0;i<forragueira.length;i++){
      for(int p =0;p<fazenda.length;p++){
        if(forragueira[i]==fazenda[p].fazendaForragueras[forragueira[i].categoria]){
          pertence.add(forragueira[i]);
          p=fazenda.length;
        }
      }


    }
    return pertence;

  }
  List<int> criaListaDeZero(int numeroDeElemento){
    List<int> novaLista=List();
    for(int i =0;i<numeroDeElemento;i++){
      novaLista.add(0);
    }
    return novaLista;



  }    

  List<int> copiaListaEscolida(List<int> lista){
    List<int> novaLista=List();
    for(int i=0;i<lista.length;i++){
      if(lista[i]==1){
        novaLista.add(1);
      }
      else{
        novaLista.add(0);
      }

    }
    return novaLista;

  }

  void voltarEstado(int estadoDeRetorno){
    
    
    this.escolido.removeRange(estadoDeRetorno+1, this.escolido.length);
    this.possiveveisFazendas.removeRange(estadoDeRetorno+1,this.possiveveisFazendas.length );
    this.opcoesForragueras.removeRange(estadoDeRetorno+1, this.opcoesForragueras.length);
    
  }




}