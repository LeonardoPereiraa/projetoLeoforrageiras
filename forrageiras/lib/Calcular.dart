import 'package:flutter/material.dart';
import 'package:forrageiras/ManageCombobox.dart';
import 'package:forrageiras/Resultado.dart';

class Calcular extends StatefulWidget {
  Calcular({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _CalcularState createState() => _CalcularState();
}

class _CalcularState extends State<Calcular> {
  int _counter = 0;
  ManageCombobox manageCombobox;
  _CalcularState() {
    this.manageCombobox = new ManageCombobox();
  }

  void _resetestado() {
    if(!this.manageCombobox.manageCombo.aguardarCarregamento){
    setState(() {
     
      this.manageCombobox.manageCombo.SReset();
      this.manageCombobox.manageCombo.aguardarCarregamento= true;
     
      
    });
    }
  }

  @override
  Widget build(BuildContext context) {
    
     
    
    return MaterialApp( 
    
    theme: ThemeData(
      canvasColor:Colors.blue[800],
      primaryColor: Colors.blue,
      accentColor: Colors.blue[700],

    ),
    
    home:Scaffold(
      appBar: AppBar(
        leading: IconButton(icon: Icon(Icons.arrow_back ) , onPressed: (){ 
          
          Navigator.pop(context);
          }) ,
        
        backgroundColor: Colors.blue[700],
        title: Text(widget.title),
      ),
     
      backgroundColor: Colors.blue[800],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
           
                this.manageCombobox,
            SingleChildScrollView(
              child: Center(
                  child:
                  GestureDetector(
                      onTap: () {
                        if (this
                                .manageCombobox
                                .manageCombo
                                .quantidadeJaEscolida ==
                            13) {
                          String resultado =
                              this.manageCombobox.manageCombo.cultivoDeSaida();
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Resultado(
                                        title: "Resultado",
                                        resultado: resultado,
                                      )));
                        }
                      },
                      child:Container(
                        width: 200,
                        height: 50,
                        margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 7.0),
                        child: Center(
                          child: Text(
                            "calcular",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                            ),
                          ),
                        ),
                        decoration: BoxDecoration(
                            color: Colors.blue[700],
                            borderRadius: BorderRadius.circular(20)),
                      )
                      )),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _resetestado,
        tooltip: 'Increment',
        child: Icon(Icons.autorenew),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    ));
    
  }
}
