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

String jsonGryffindor = './lib/caracteristicas/datos/datos_gryffindor.json';
List<dynamic> json = [];
List<Personaje> listaEscuelas = [];

abstract class RepositorioEscuela {
  Future<Either<Problema, Personaje>> obtenerEscuela(
      NombreFormado escuela, NombreFormado nombre);
}

class RepositorioEscuelaReal extends RepositorioEscuela {
  @override
  Future<Either<Problema, Personaje>> obtenerEscuela(
      NombreFormado escuela, NombreFormado nombre) async {
    String valorEscuela = escuela.valor.toLowerCase();
    String base =
        'https://hp-api.onrender.com/api/characters/house/$valorEscuela';
    if (listaEscuelas.isEmpty) {
      //si la lista esta vacia, consume la api
      Uri direccion = Uri.parse(base);
      final respuesta = await http.get(direccion);
      if (respuesta.statusCode != 200) {
        return left(ErrorDeConexion());
      }
      //si no hubo problema al recibir la respuesta, esta se guarda
      json = jsonDecode(respuesta.body);
      //se obtiene la lista de los personajes
      try {
        listaEscuelas = obtenerListaEscuelas(json);
      } catch (e) {
        return Left(JsonMalFormado());
      }
    }
    //si la lista no esta vacia no consume la api y solo busca el personaje
    for (var i = 0; i < listaEscuelas.length; i++) {
      if (listaEscuelas[i].escuela != escuela.valor) {
        return Left(NoEsDeLaEscuela());
      }
      if (listaEscuelas[i].nombre == nombre.valor) {
        return Right(listaEscuelas[i]);
      }
    }
    return Left(EstudianteNoEncontrado());
  }
}

class RepositorioPruebasEstudiante extends RepositorioEscuela {
  @override
  Future<Either<Problema, Personaje>> obtenerEscuela(
      NombreFormado escuela, NombreFormado nombre) async {
    String valorEscuela = escuela.valor.toLowerCase();
    if (listaEscuelas.isEmpty) {
      try {
        json = leeJson(jsonGryffindor);
      } catch (e) {
        return Left(JsonNoEncontrado());
      }
    }
    try {
      listaEscuelas = obtenerListaEscuelas(json);
      for (var i = 0; i < listaEscuelas.length; i++) {
        if (listaEscuelas[i].escuela != valorEscuela) {
          return Left(NoEsDeLaEscuela());
        }
        if (listaEscuelas[i].nombre == nombre.valor) {
          return Right(listaEscuelas[i]);
        }
      }
    } catch (e) {
      return Left(JsonMalFormado());
    }
    return Left(EstudianteNoEncontrado());
  }
}

List<dynamic> leeJson(String rutaJson) {
  List<dynamic> json;
  json = jsonDecode((File(rutaJson).readAsStringSync()));
  return json;
}

List<Personaje> obtenerListaEscuelas(List<dynamic> json) {
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