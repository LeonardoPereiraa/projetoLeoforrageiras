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
      home: PageInicial(title:"Projeto Forrageiras",),
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
        appBar: AppBar(centerTitle: true,
          title: Text(widget.title),
        ),
        body: SingleChildScrollView(child: Center(child:Column(children:<Widget>[ 
          Container(
            padding: EdgeInsets.only(top: 30.0 ,bottom: 20.0),
            child: Icon(MdiIcons.calculator,size: 250,color: Colors.blue,),

          ),
          Center(
          child: GestureDetector(
             onTap: (){
               Navigator.push(context, MaterialPageRoute(builder: (context) => Calcular(title: "calculadora")));
            },
            child: Container(
              width: 200,
              height: 50,
              child:Center( 
                child:Text("calculadora",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                  
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.blue[400],
                borderRadius: BorderRadius.circular(20)
              
              ),
            ),
          ) ,
          
        ),
        ],
        ),
        ),

      ),);
  }


}

