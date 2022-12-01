import 'package:hp_api_application/caracteristicas/dominio/nombre_formado.dart';
import 'package:hp_api_application/caracteristicas/repositorios/repositorio_json.dart';

import '../dominio/personaje.dart';
import '../dominio/problema.dart';
import 'package:fpdart/fpdart.dart';

String _nombrejson = '';
List<dynamic>? _nombresAlt;
String? _especie;
String? _genero;
String? _escuela;
String? _fechaNac;
int? _anioNac;
bool? _mago;
String? _ancestro;
String? _colorOjos;
String? _colorCabello;
Map? _varita;
String? _patronus;
bool? _estudianteHowarts;
bool? _varitaHowarts;
String? _actor;
List<dynamic>? _actoresAlt;
bool? _vive;
String? _imagen;

String _jsonGryffindor = './lib/caracteristicas/datos/datos_gryffindor.json';
List<dynamic> json = [];
List<Personaje> _listaEscuelas = [];

abstract class RepositorioEscuela {
  late RepositorioPruebaJson constructor;
  RepositorioEscuela(this.constructor);
  Future<Either<Problema, Personaje>> obtenerEscuela(
      NombreFormado escuela, NombreFormado nombre);
}

class RepositorioEscuelaReal extends RepositorioEscuela {
  RepositorioEscuelaReal(super.constructor);

  @override
  Future<Either<Problema, Personaje>> obtenerEscuela(
      NombreFormado escuela, NombreFormado nombre) async {
    String valorEscuela = escuela.valor.toLowerCase();
    String base =
        'https://hp-api.onrender.com/api/characters/house/$valorEscuela';
    var resultado = await constructor.obtenerDatos('online', base);
    resultado.match((l) {
      return Left(l);
    }, (r) {
      _listaEscuelas = _obtenerListaEscuelas(r);
    });
    for (var i = 0; i < _listaEscuelas.length; i++) {
      if (_listaEscuelas[i].escuela!.toLowerCase() !=
          escuela.valor.toLowerCase()) {
        return Left(EscuelaNoEncontrada());
      }
      if (_listaEscuelas[i].nombre.toLowerCase() ==
          nombre.valor.toLowerCase()) {
        return Right(_listaEscuelas[i]);
      }
    }
    return Left(PersonajeNoEncontrado());
  }
}

class RepositorioPruebasEscuela extends RepositorioEscuela {
  RepositorioPruebasEscuela(super.constructor);

  @override
  Future<Either<Problema, Personaje>> obtenerEscuela(
      NombreFormado escuela, NombreFormado nombre) async {
    var resultado = await constructor.obtenerDatos('offline', _jsonGryffindor);
    resultado.match((l) {
      return Left(l);
    }, (r) {
      _listaEscuelas = _obtenerListaEscuelas(r);
    });
    for (var i = 0; i < _listaEscuelas.length; i++) {
      if (_listaEscuelas[i].escuela!.toLowerCase() !=
          escuela.valor.toLowerCase()) {
        return Left(EscuelaNoEncontrada());
      }
      if (_listaEscuelas[i].nombre.toLowerCase() ==
          nombre.valor.toLowerCase()) {
        return Right(_listaEscuelas[i]);
      }
    }
    return Left(PersonajeNoEncontrado());
  }
}

List<Personaje> _obtenerListaEscuelas(List<dynamic> json) {
  List<Personaje> listaPersonajes = [];
  Personaje p;
  for (var i = 0; i < json.length; i++) {
    _nombrejson = json[i]['name'];
    _nombresAlt = json[i]['alternate_names'];
    _especie = json[i]['species'];
    _genero = json[i]['gender'];
    _escuela = json[i]['house'];
    _fechaNac = json[i]['dateOfBirth'];
    _anioNac = json[i]['yearOfBirth'];
    _mago = json[i]['wizard'];
    _ancestro = json[i]['ancestry'];
    _colorOjos = json[i]['eyeColour'];
    _colorCabello = json[i]['hairColour'];
    _varita = json[i]['wand'];
    _patronus = json[i]['patronus'];
    _estudianteHowarts = json[i]['hogwartsStudent'];
    _varitaHowarts = json[i]['hogwartsStaff'];
    _actor = json[i]['actor'];
    _actoresAlt = json[i]['alternate_actors'];
    _vive = json[i]['alive'];
    _imagen = json[i]['image'];
    p = Personaje.constructor(
        nombre: _nombrejson,
        actor: _actor,
        actoresAlt: _actoresAlt,
        ancestro: _ancestro,
        anioNac: _anioNac,
        colorCabello: _colorCabello,
        colorOjos: _colorOjos,
        escuela: _escuela,
        especie: _especie,
        estudianteHowarts: _estudianteHowarts,
        fechaNac: _fechaNac,
        genero: _genero,
        mago: _mago,
        nombresAlt: _nombresAlt,
        imagen: _imagen,
        patronus: _patronus,
        varita: _varita,
        varitaHowarts: _varitaHowarts,
        vive: _vive);
    listaPersonajes.add(p);
  }
  return listaPersonajes;
}
