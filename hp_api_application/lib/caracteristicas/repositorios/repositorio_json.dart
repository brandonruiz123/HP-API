import 'dart:convert';
import 'dart:io';

import 'package:fpdart/fpdart.dart';

import '../dominio/problema.dart';

import 'package:http/http.dart' as http;

List<dynamic> _json = [];

abstract class RepositorioJson{
  Future<Either<Problema,List<dynamic>>> obtenerDatos(String modo, String ruta);
}
class RepositorioPruebaJson extends RepositorioJson{
  @override
  Future<Either<Problema,List<dynamic>>> obtenerDatos(String modo, String ruta)async{
    if (modo == 'online') {
      try {
      Uri direccion = Uri.parse(ruta);
      final respuesta = await http.get(direccion);
      if (respuesta.statusCode != 200) {
        return left(ErrorDeConexion());
      }
        _json = jsonDecode(respuesta.body);
        for (var i = 0; i < _json.length; i++) {
          if (!_json[i].toString().contains('name:')) {
            return Left(JsonMalFormado());
          } 
        }
      } catch (e) {
        return Left(JsonNoEncontrado());
      }
      return Right(_json);
    }
    if (modo == 'offline') {
      try {
        _json = jsonDecode((File(ruta).readAsStringSync()));
        for (var i = 0; i < _json.length; i++) {
          if (!_json[i].toString().contains('name:')) {
            return Left(JsonMalFormado());
          } 
        }
      } catch (e) {
        return Left(JsonNoEncontrado());
      }
      return Right(_json);
    }
    return Left(ModoEquivocado());
  }

}