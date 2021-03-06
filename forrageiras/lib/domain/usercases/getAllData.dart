import 'package:forrageiras/domain/entities/Dado.dart';
import 'package:forrageiras/domain/repositories/IGetRepository.dart';

abstract class IGetAllData{
 Future<Dado> getData();
}


class GetAllData implements IGetAllData{
  IGetRepository repositorio;

  GetAllData(IGetRepository repositorio){
    this.repositorio = repositorio;
  }

  @override
  Future<Dado> getData() async{
    return await this.repositorio.getData();
  }



}