import 'dart:io';
import 'package:flutter/services.dart';
import 'package:forrageiras/infra/datasources/IAllDatasource.dart';
import 'package:forrageiras/infra/model/ResultDadoModel.dart';
import 'package:path_provider/path_provider.dart';

class ArquivoData implements IAllDatasource{
  @override
  Future<ResultDadoModel> getData() async{
    
    String arqConteudo = await _readCounter("forragueira.json");
    ResultDadoModel model = new ResultDadoModel();
    print("ArquivoData");
    print(arqConteudo);
    model.fromJson(arqConteudo);
    return model;
  }



  Future<String> _readCounter(String arqName) async {
    try {
      final file = await _localFile(arqName);

      // Read the file
       return await file.readAsString();

      
    } catch (e) {
      // If encountering an error, return 0
      return _readOpcional();
    }
}

Future<File> _localFile(String arqName) async {
    final path = await _localPath;
    return File('$path'+ arqName);
}

Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }


Future<String> _readOpcional() async {
	try{
		return await rootBundle.loadString('assets/forragueira.json');
	
	}catch(e){

		return "";
	}


}
}