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

String jsonEstudiante = './lib/caracteristicas/datos/datos_estudiantes.json';
List<dynamic> json = [];
List<Personaje> listaEstudiantes = [];

abstract class RepositorioEstudiante {
  Future<Either<Problema, Personaje>> obtenerEstudiante(NombreFormado nombre);
}

class RepositorioEstudianteReal extends RepositorioEstudiante {
  @override
  Future<Either<Problema, Personaje>> obtenerEstudiante(
      NombreFormado nombre) async {
    String base = 'https://hp-api.onrender.com/api/characters/students';
    if (listaEstudiantes.isEmpty) {
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
        listaEstudiantes = obtenerListaEstudiantes(json);
      } catch (e) {
        return Left(JsonMalFormado());
      }
    }
    //si la lista no esta vacia no consume la api y solo busca el personaje
    for (var i = 0; i < listaEstudiantes.length; i++) {
      if (listaEstudiantes[i].estudianteHowarts == false) {
        return Left(NoEsEstudiante());
      }
      if (listaEstudiantes[i].nombre == nombre.valor) {
        return Right(listaEstudiantes[i]);
      }
    }
    return Left(EstudianteNoEncontrado());
  }
}

class RepositorioPruebasEstudiante extends RepositorioEstudiante {
  @override
  Future<Either<Problema, Personaje>> obtenerEstudiante(
      NombreFormado nombre) async {
    if (listaEstudiantes.isEmpty) {
      try {
        json = leeJson(jsonEstudiante);
      } catch (e) {
        return Left(JsonNoEncontrado());
      }
    }
    try {
      listaEstudiantes = obtenerListaEstudiantes(json);
      for (var i = 0; i < listaEstudiantes.length; i++) {
        if (listaEstudiantes[i].estudianteHowarts == false) {
          return Left(NoEsEstudiante());
        }
        if (listaEstudiantes[i].nombre == nombre.valor) {
          return Right(listaEstudiantes[i]);
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

List<Personaje> obtenerListaEstudiantes(List<dynamic> json) {
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
