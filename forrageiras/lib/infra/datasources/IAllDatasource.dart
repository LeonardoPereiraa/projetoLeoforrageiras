import 'package:forrageiras/infra/model/ResultDadoModel.dart';

abstract class IAllDatasource{


  Future<ResultDadoModel> getData();
  }