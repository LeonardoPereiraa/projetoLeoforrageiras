import 'package:flutter/material.dart';
import 'package:forrageiras/Fazenda.dart';

class Forragueira {
  String categoria;
  String tipo;
  List<Fazenda> fazendas=List();
  Forragueira(String categoria,String tipo,Fazenda fazenda ){
    this.categoria = categoria;
    this.tipo = tipo;
    this.fazendas.add(fazenda);
    fazenda.fazendaForragueras[this.categoria]=this;
    
  }
  
  bool verificarTipo(String tipo){
    if(this.tipo == tipo){
      return true;
    }
    return false;

  }
  void addFazenda(Fazenda fazenda){
    this.fazendas.add(fazenda);
    fazenda.fazendaForragueras[this.categoria]=this;

  }
}