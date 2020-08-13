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
         backgroundColor: Colors.blue[700],
         
        
        title: Text(widget.title,),
      ),
      backgroundColor: Colors.blue[800],
      body: Center(
        
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Cultivo de \n"+ widget.resultado, 
            style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
            
            )
            
            
          ],
        ),
        
      ),
       // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
