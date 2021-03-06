import 'package:forrageiras/domain/entities/Dado.dart';

abstract class IGetRepository{


  Future<Dado> getData();

}