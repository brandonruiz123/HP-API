import 'dart:convert';
import 'dart:io';

import 'package:hp_api_application/caracteristicas/dominio/nombre_formado.dart';

import '../dominio/personaje.dart';
import '../dominio/problema.dart';
import 'package:fpdart/fpdart.dart';
import 'package:http/http.dart' as http;

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
    String nombrejson;
    List<dynamic> nombresAlt;
    String especie;
    String genero;
    String escuela;
    String fechaNac;
    int anioNac;
    bool mago;
    String ancestro;
    String colorOjos;
    String colorCabello;
    Map varita;
    String patronus;
    bool estudianteHowarts;
    bool varitaHowarts;
    String actor;
    List<dynamic> actoresAlt;
    bool vive;
    String imagen;
    for (var i = 0; i < json.length; i++) {
      try {
        if (json[i]["name"] == nombre.nombre) {
          nombrejson = json[i]['name'];
          nombresAlt = json[i]['alternate_names'];
          especie = json[i]['species'];
          genero = json[i]['gender'];
          escuela = json[i]['house'];
          fechaNac = json[i]['dateOfBirth'];
          anioNac = json[i]['yearOfBirth'];
          mago = json[i]['wizard'];
          ancestro = json[i]['ancestry'];
          colorOjos = json[i]['eyeColour'];
          colorCabello = json[i]['hairColour'];
          varita = json[i]['wand'];
          patronus = json[i]['patronus'];
          estudianteHowarts = json[i]['hogwartsStudent'];
          varitaHowarts = json[i]['hogwartsStaff'];
          actor = json[i]['actor'];
          actoresAlt = json[i]['alternate_actors'];
          vive = json[i]['alive'];
          imagen = json[i]['image'];
          p = Personaje.constructor(
              nombre: nombrejson,
              actor: actor,
              actoresAlt: actoresAlt,
              ancestro: ancestro,
              anioNac: anioNac,
              colorCabello: colorCabello,
              colorOjos: colorOjos,
              escuela: escuela,
              especie: especie,
              estudianteHowarts: estudianteHowarts,
              fechaNac: fechaNac,
              genero: genero,
              mago: mago,
              nombresAlt: nombresAlt,
              imagen: imagen,
              patronus: patronus,
              varita: varita,
              varitaHowarts: varitaHowarts,
              vive: vive);
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
    String nombrejson;
    List<dynamic> nombresAlt;
    String especie;
    String genero;
    String escuela;
    String fechaNac;
    int anioNac;
    bool mago;
    String ancestro;
    String colorOjos;
    String colorCabello;
    Map varita;
    String patronus;
    bool estudianteHowarts;
    bool varitaHowarts;
    String actor;
    List<dynamic> actoresAlt;
    bool vive;
    String imagen;
    for (var i = 0; i < json.length; i++) {
      try {
        if (json[i]["name"] == nombre.nombre) {
          nombrejson = json[i]['name'];
          nombresAlt = json[i]['alternate_names'];
          especie = json[i]['species'];
          genero = json[i]['gender'];
          escuela = json[i]['house'];
          fechaNac = json[i]['dateOfBirth'];
          anioNac = json[i]['yearOfBirth'];
          mago = json[i]['wizard'];
          ancestro = json[i]['ancestry'];
          colorOjos = json[i]['eyeColour'];
          colorCabello = json[i]['hairColour'];
          varita = json[i]['wand'];
          patronus = json[i]['patronus'];
          estudianteHowarts = json[i]['hogwartsStudent'];
          varitaHowarts = json[i]['hogwartsStaff'];
          actor = json[i]['actor'];
          actoresAlt = json[i]['alternate_actors'];
          vive = json[i]['alive'];
          imagen = json[i]['image'];
          p = Personaje.constructor(
              nombre: nombrejson,
              actor: actor,
              actoresAlt: actoresAlt,
              ancestro: ancestro,
              anioNac: anioNac,
              colorCabello: colorCabello,
              colorOjos: colorOjos,
              escuela: escuela,
              especie: especie,
              estudianteHowarts: estudianteHowarts,
              fechaNac: fechaNac,
              genero: genero,
              mago: mago,
              nombresAlt: nombresAlt,
              imagen: imagen,
              patronus: patronus,
              varita: varita,
              varitaHowarts: varitaHowarts,
              vive: vive);
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
