import 'package:flutter/material.dart';
import 'resultado.dart';
import 'dados.dart';

class Calcular extends StatefulWidget {
  Calcular({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _CalcularState createState() => _CalcularState();
}

class _CalcularState extends State<Calcular> {
  int _counter = 0;

// combobox
  List<List<DropdownMenuItem<List<int>>>> _dropDownMenuItems ;
  List<List<int>> combobox ;
  List<int> a;
  List<String> titulo = ["PRODUTIVIDADE","PROPAGAÇÃO","FERTILIDADE","TOL. ACIDEZ","TOL. SECA","TOL. FRIO" 
  ,"SOLO ENCHARCADO","RESIST. CIGARRINHA","ESTABELECIMENTO","RELEVO","USO","TOL. SOMBREAMENTO","ANIMAL","CULTIVAR"];
  List<List<int>> ordemCombobox;

//
  Dados entradas;
  void initState() {
    _dropDownMenuItems = new List();
    combobox = new List();
    entradas = new Dados();
    ordemCombobox= List();
    for (int i = 0; i < 14; i++) {
      combobox.add(a);
      _dropDownMenuItems.add(getDropDownMenuItems(entradas, i));
    }
    ordemCombobox.add(entradas.gera_lista_sequencia(titulo.length));
    ordemCombobox.add(entradas.gera_lista_sequencia(1));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            
            icon:Icon( Icons.autorenew) ,
            onPressed: (){
              resetSistema();
            },
          )
        ],
        title: Text(widget.title),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Flexible(
              child: Container(
                width: 248.0,
                child: ListView.builder(
                    padding: const EdgeInsets.all(8.0),
                    itemCount: 13,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        padding:EdgeInsets.only(left: 0.0 , top: 15.0 ,right: 0.0 , bottom: 15.0) ,  
                        child:Column(children: <Widget>[
                         Container(
                           alignment: Alignment.topLeft,
                           child:Text(titulo[ordemCombobox[0][index]])
                           ), 
                         DropdownButton<List<int>>(
                          isExpanded: true,
                          value: combobox[ordemCombobox[0][index]],
                          items: _dropDownMenuItems[ordemCombobox[0][index]],
                          onChanged: (List<int> combobox) {
                            changedDropDownItem(combobox);
                          },
                        ),
                        ], 
                      ),
                      );
                    }),
              ),
            )
          ],
        ),
      ),
    );
  }

  List<DropdownMenuItem<List<int>>> getDropDownMenuItems(
      Dados dados, int coluna) {
    List<DropdownMenuItem<List<int>>> items = new List();

    for (int i = 0; i < dados.repeticao[coluna].length; i++) {
      items.add(new DropdownMenuItem(
          value: dados.repeticao[coluna][i],
          child: new Text(
              dados.getElemento(dados.repeticao[coluna][i][0], coluna))));

     
    }
    
    return items;
  }

  void changedDropDownItem(List<int> selectedCity) {
    if (entradas.pega_estado_ja_escolido(selectedCity[selectedCity.length - 1]) == false) {
      entradas.intersecao(selectedCity);

      setState(() {
        combobox[selectedCity[selectedCity.length - 1]] = selectedCity;
        entradas.muda_ja_escolido(selectedCity[selectedCity.length - 1]);
        entradas.add_elemento_grafo_deletado(selectedCity[selectedCity.length - 1], -1);
        
        comutaElementos(ordemCombobox[0],ordemCombobox[1][0],ordemCombobox[0].indexOf(selectedCity[selectedCity.length - 1]));
        ordemCombobox[1][0]= ordemCombobox[1][0] +1;

        for (int i = 0; i < _dropDownMenuItems.length; i++) {
          if (entradas.pega_estado_ja_escolido(i) == false) {
            for (int p = 0; p < _dropDownMenuItems[i].length; p++) {
              if (entradas.pertence(_dropDownMenuItems[i][p].value) == true) {
                if (entradas.contido(_dropDownMenuItems[i][p].value) == true) {
                  int tamanho = _dropDownMenuItems[i][p].value.length;
                  entradas.add_elemento_grafo_deletado(
                      _dropDownMenuItems[i][p].value[tamanho - 1], -2);
                  combobox[_dropDownMenuItems[i][p].value[tamanho - 1]] =
                      _dropDownMenuItems[i][p].value;
                  entradas.muda_ja_escolido(
                      _dropDownMenuItems[i][p].value[tamanho - 1]);

                  comutaElementos(ordemCombobox[0],ordemCombobox[1][0],ordemCombobox[0].indexOf(_dropDownMenuItems[i][p].value[tamanho - 1]));
                  ordemCombobox[1][0]= ordemCombobox[1][0] +1;
                }
              } else {
                entradas.add_elemento_grafo_deletado(
                    i, _dropDownMenuItems[i][p].value[0]);
                _dropDownMenuItems[i].removeAt(p);
                p = p - 1;
              }
            }
          }
        }
      });
      if(entradas.quantidade_de_ja_escolido() >= titulo.length -1){

        Navigator.push(context, MaterialPageRoute(builder: (context) => new Resultado(entradas ,_dropDownMenuItems[_dropDownMenuItems.length -1])));
        
        
      }
    } else {
      while (selectedCity[selectedCity.length - 1] !=
          entradas.paga_colunaUltimo_grafo_deletado()) {
        int coluna = entradas.paga_colunaUltimo_grafo_deletado();
        int linha = entradas.pega_linhaRepeticao_referentaAoGrafo(
            coluna, entradas.paga_LinhaUltimo_grafo_deletado());
        if (linha != -1 && linha != -2) {
          DropdownMenuItem<List<int>> novoItem = new DropdownMenuItem(
              value: entradas.repeticao[coluna][linha],
              child: new Text(entradas.getElemento(
                  entradas.repeticao[coluna][linha][0], coluna)));
          setState(() {
            _dropDownMenuItems[coluna].add(novoItem);
          });
        } else {
          entradas.muda_ja_escolido(coluna);
          combobox[coluna] = a;
          ordemCombobox[1][0]= ordemCombobox[1][0] -1;


        }
        entradas.remove_ultimoElemento_grafo_deletado();
      }
      entradas.organizar_lista_possiveis_linhas(
          selectedCity[selectedCity.length - 1], combobox);
      entradas.remove_ultimoElemento_grafo_deletado();
      entradas.muda_ja_escolido(selectedCity[selectedCity.length - 1]);
      ordemCombobox[1][0]= ordemCombobox[1][0] -1;
      changedDropDownItem(selectedCity);

    }

  }
  void comutaElementos(List<int> lista,int posicao1, int posicao2){
    int auxiliar1 = lista[posicao1];
    int auxiliar2 =lista[posicao2];
    lista[posicao1]=auxiliar2;
    lista[posicao2]=auxiliar1;
  }

  void resetSistema(){
    setState(() {
    _dropDownMenuItems = new List();
    combobox = new List();
    entradas = new Dados();
    ordemCombobox= List();
   
    entradas = new Dados();
    for (int i = 0; i < 14; i++) {
      combobox.add(a);
      _dropDownMenuItems.add(getDropDownMenuItems(entradas, i));
    }
    ordemCombobox.add(entradas.gera_lista_sequencia(titulo.length));
    ordemCombobox.add(entradas.gera_lista_sequencia(1));
     });
  }
}
