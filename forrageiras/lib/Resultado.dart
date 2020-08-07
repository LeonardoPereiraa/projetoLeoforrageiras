import 'package:flutter/material.dart';
import 'package:forrageiras/ManageCombobox.dart';




class Resultado extends StatefulWidget {
  Resultado({Key key, this.title,this.resultado}) : super(key: key);


  String resultado;
  final String title;

  @override
  _ResultadoState createState() => _ResultadoState();
}


class _ResultadoState extends State<Resultado> {
  int _counter = 0;
  ManageCombobox manageCombobox;
  _MyHomePageState(){
    this.manageCombobox= new ManageCombobox();


  }





  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        
        title: Text(widget.title),
      ),
      body: Center(
        
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(widget.resultado)
            
            
          ],
        ),
        
      ),
       // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
