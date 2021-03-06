import 'package:forrageiras/domain/entities/Dado.dart';
import 'package:forrageiras/domain/repositories/IGetRepository.dart';
import 'package:forrageiras/infra/datasources/IAllDatasource.dart';

class GetDataRepositore implements IGetRepository{
  IAllDatasource  datasource;

  GetDataRepositore(this.datasource);
  @override
  Future<Dado> getData() async {
    
    return await this.datasource.getData();
  }



  
}