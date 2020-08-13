import 'package:flutter/material.dart';
import 'package:forrageiras/Calcular.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PageInicial(
        title: "Projeto Forrageiras",
      ),
    );
  }
}

class PageInicial extends StatefulWidget {
  PageInicial({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _PageInicial createState() => _PageInicial();
}

class _PageInicial extends State<PageInicial> {
  Widget build(BuildContext context) {
    return Scaffold(
      /*appBar: AppBar(centerTitle: true,
          title: Text(widget.title),r
        ),*/
      backgroundColor: Colors.blue[800],
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(
                    left: 0, top: 80.0, right: 0.0, bottom: 0.0),
               child:Text(
                "Projeto \n Forrageiras",
                style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              ),
              Container(
                margin: EdgeInsets.only(
                    left: 0, top: 30.0, right: 0.0, bottom: 40.0),
                //padding: EdgeInsets.only(top: 30.0, bottom: 20.0),
                child: Icon(
                  MdiIcons.calculator,
                  size: 270,
                  color: Colors.white,
                ),
              ),
              Center(
                
                
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                Calcular(title: "Calculadora")));
                  },
                  child: Container(
                    width: 200,
                    height: 70,
                    child: Center(
                      child: Text(
                        "Calculadora",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    decoration: BoxDecoration(
                        color: Colors.blue[700],
                        borderRadius: BorderRadius.circular(20)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
