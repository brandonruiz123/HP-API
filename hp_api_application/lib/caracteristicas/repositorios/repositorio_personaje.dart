import 'dart:convert';
import 'dart:io';

import 'package:hp_api_application/caracteristicas/dominio/nombre_formado.dart';

import '../dominio/personaje.dart';
import '../dominio/problema.dart';
import 'package:fpdart/fpdart.dart';
import 'package:http/http.dart' as http;

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

abstract class RepositorioPersonaje {
  Future<Either<Problema, Personaje>> obtenerPersonaje(NombreFormado nombre);
}

class RepositorioPersonajeReal extends RepositorioPersonaje {
  @override
  Future<Either<Problema, Personaje>> obtenerPersonaje(
      NombreFormado nombre) async {
    Personaje p;
    String base = 'https://hp-api.onrender.com/api/characters';
    Uri direccion = Uri.parse(base);
    final respuesta = await http.get(direccion);
    if (respuesta.statusCode != 200) {
      return left(ErrorDeConexion());
    }
    List<dynamic> json = jsonDecode(respuesta.body);

    for (var i = 0; i < json.length; i++) {
      try {
        if (json[i]["name"] == nombre.nombre) {
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
          return Right(p);
        }
      } catch (e) {
        return Left(JsonMalFormado());
      }
    }
    return Left(PersonajeNoEncontrado());
  }
}

class RepositorioPruebasPersonaje extends RepositorioPersonaje {
  @override
  Future<Either<Problema, Personaje>> obtenerPersonaje(
      NombreFormado nombre) async {
    Personaje p;
    String jsonPersonaje = './lib/caracteristicas/datos/datos_personaje.json';
    List<dynamic> json;
    try {
      json = leeJson(jsonPersonaje);
    } catch (e) {
      return Left(JsonNoEncontrado());
    }
    for (var i = 0; i < json.length; i++) {
      try {
        if (json[i]["name"] == nombre.nombre) {
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
          return Right(p);
        }
      } catch (e) {
        return Left(JsonMalFormado());
      }
    }
    return Left(PersonajeNoEncontrado());
  }
}

List<dynamic> leeJson(String rutaJson) {
  List<dynamic> json;
  json = jsonDecode((File(rutaJson).readAsStringSync()));
  return json;
}
