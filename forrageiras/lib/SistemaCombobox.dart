import 'package:flutter/material.dart';
import 'package:forrageiras/Forragueira.dart';
import 'package:forrageiras/ManageCombobox.dart';

class SistemaCombobox {
  String nomeCombobox;
  List<Forragueira> forraguera;
  List<DropdownMenuItem<Forragueira>> _dropDownMenuItems;
  Forragueira currentCity;
  ManageComboboxState manage;

  SistemaCombobox(ManageComboboxState manage, List forraguera, String nome) {
    this.nomeCombobox=nome;
    this.manage = manage;
    atualizar(forraguera);
    
  }
  @override
  Widget menuDropdonw() {
    return Column(children: <Widget>[
      Container(
        alignment: Alignment.topLeft,
        child:Text(this.nomeCombobox)
      ),
      DropdownButton(
        isExpanded: true,
        value: currentCity,
        items: _dropDownMenuItems,
        onChanged: changedDropDownItem,
      )
    ]);
  }

  void changedDropDownItem(Forragueira selectedForragueira) {
    manage.ChangeCombobox(selectedForragueira, this);
  }

  List<DropdownMenuItem<Forragueira>> getDropDownMenuItems() {
    List<DropdownMenuItem<Forragueira>> items = new List();
    for (int i = 0; i < this.forraguera.length; i++) {
      items.add(new DropdownMenuItem(
          value: forraguera[i], child: new Text(forraguera[i].tipo)));
    }
    return items;
  }





  void ordenarCombobox(){
    DropdownMenuItem<Forragueira> auxiliar; 
    for(int i =0; i<_dropDownMenuItems.length;i++){
      for(int p = i ; p<_dropDownMenuItems.length;p++){
        if(_dropDownMenuItems[i].value.tipo.compareTo(_dropDownMenuItems[p].value.tipo)==1){
          auxiliar = _dropDownMenuItems[i];
          _dropDownMenuItems[i]=_dropDownMenuItems[p];
          _dropDownMenuItems[p]=auxiliar;
        }
      }

    }  


  }
  atualizar(List<Forragueira> novaForragueira){
    this.forraguera = novaForragueira;
    this._dropDownMenuItems = getDropDownMenuItems();
    this.currentCity= null;
    ordenarCombobox();
  }
  bool escolherElementoUnico(){
   
    if(this._dropDownMenuItems.length==1){
      
      
       
      changedDropDownItem(this._dropDownMenuItems[0].value);
      return true; 
    }
    return false;
  }




}
