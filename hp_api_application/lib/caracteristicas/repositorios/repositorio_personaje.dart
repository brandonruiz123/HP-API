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

List<Personaje> _listaPersonajes = [];
String _base = 'https://hp-api.onrender.com/api/characters';
String _jsonPersonaje = './lib/caracteristicas/datos/datos_personaje.json';

abstract class RepositorioPersonaje {
  late RepositorioPruebaJson constructor;
  RepositorioPersonaje(this.constructor);
  Future<Either<Problema, Personaje>> obtenerPersonaje(NombreFormado nombre);
}

class RepositorioPersonajeReal extends RepositorioPersonaje {
  RepositorioPersonajeReal(super.constructor);
  @override
  Future<Either<Problema, Personaje>> obtenerPersonaje(
      NombreFormado nombre) async {
    if (_listaPersonajes.isEmpty) {
      var resultado = await constructor.obtenerDatos('online', _base);
      resultado.match((l) {
        return Left(l);
      }, (r) {
        _listaPersonajes = _obtenerListaPersonajes(r);
      });
    }
    for (var i = 0; i < _listaPersonajes.length; i++) {
      if (_listaPersonajes[i].nombre == nombre.valor) {
        return Right(_listaPersonajes[i]);
      }
    }
    return Left(PersonajeNoEncontrado());
  }
}

class RepositorioPruebasPersonaje extends RepositorioPersonaje {
  RepositorioPruebasPersonaje(super.constructor);

  @override
  Future<Either<Problema, Personaje>> obtenerPersonaje(
      NombreFormado nombre) async {
    if (_listaPersonajes.isEmpty) {
      var resultado = await constructor.obtenerDatos('offline', _jsonPersonaje);
      resultado.match((l) {
        return Left(l);
      }, (r) {
        _listaPersonajes = _obtenerListaPersonajes(r);
      });
    }
    for (var i = 0; i < _listaPersonajes.length; i++) {
      if (_listaPersonajes[i].nombre == nombre.valor) {
        return Right(_listaPersonajes[i]);
      }
    }
    return Left(PersonajeNoEncontrado());
  }
}

List<Personaje> _obtenerListaPersonajes(List<dynamic> json) {
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
