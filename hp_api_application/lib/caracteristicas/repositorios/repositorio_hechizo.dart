import 'package:fpdart/fpdart.dart';
import 'package:hp_api_application/caracteristicas/repositorios/repositorio_json.dart';
import '../dominio/hechizo.dart';
import '../dominio/problema.dart';
import '../dominio/nombre_formado.dart';

String _base = 'https://hp-api.onrender.com/api/spells';
String _rutaJson = './lib/caracteristicas/datos/datos_hechizos.json';
List<Hechizo> _listaHechizos = [];

abstract class RepositorioHechizo {
  late RepositorioPruebaJson constructor;
  RepositorioHechizo(this.constructor);
  Future<Either<Problema, Hechizo>> obtenerHechizo(NombreFormado nombre);
}

class RepositorioHechizoReal extends RepositorioHechizo {
  RepositorioHechizoReal(super.constructor);

  @override
  Future<Either<Problema, Hechizo>> obtenerHechizo(NombreFormado nombre) async {
    try {
      var resultado = await constructor.obtenerDatos('online', _base);
      resultado.match((l) {
        return Left(l);
      }, (r) {
        try {
          _listaHechizos = _obtenerListaHechizos(r);
        } catch (e) {
          return Left(JsonMalFormado());
        }
        for (var i = 0; i < _listaHechizos.length; i++) {
          if (_listaHechizos[i].nombre == nombre.valor) {
            return Right(_listaHechizos[i]);
          }
        }
      });
    } catch (e) {
      return Left(JsonNoEncontrado());
    }
    return Left(HechizoMalFormado());
  }
}

class RepositorioPruebaHechizo extends RepositorioHechizo {
  RepositorioPruebaHechizo(super.constructor);

  @override
  Future<Either<Problema, Hechizo>> obtenerHechizo(NombreFormado nombre) async {
    var resultado = await constructor.obtenerDatos('offline', _rutaJson);
    resultado.match((l) {
      return Left(l);
    }, (r) {
      _listaHechizos = _obtenerListaHechizos(r);
    });
    if (_listaHechizos.isNotEmpty) {
      for (var i = 0; i < _listaHechizos.length; i++) {
        if (_listaHechizos[i].nombre == nombre.valor) {
          return Right(_listaHechizos[i]);
        }
      }
      return Left(HechizoNoEncontrado());
    }
    return Left(JsonMalFormado());
  }
}

List<Hechizo> _obtenerListaHechizos(List<dynamic> json) {
  List<Hechizo> listaHechizos = [];
  Hechizo h;
  for (var i = 0; i < json.length; i++) {
    h = Hechizo.constructor(
        nombre: json[i]['name'], descripcion: json[i]['description']);
    listaHechizos.add(h);
  }
  return listaHechizos;
}
