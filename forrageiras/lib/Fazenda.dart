import 'package:flutter/material.dart';
import 'package:forrageiras/Forragueira.dart';


class Fazenda{
  int codigo;
  Map<String,Forragueira> fazendaForragueras = Map();
  Fazenda(int codigo){
    this.codigo = codigo;
  }
 
 
}