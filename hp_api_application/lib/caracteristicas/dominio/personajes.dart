import 'package:flutter/foundation.dart';
import 'package:hp_api_application/caracteristicas/dominio/problema.dart';

class Personajes {
  final String nombre;
  final List<String> nombresAlt;
  final String especie;
  final String escuela;
  final String fechaNac;
  final String anioNac;
  final bool mago;
  final String ancestro;
  final String colorOjos;
  final String colorCabello;
  final Map varita;
  final String patronus;
  final bool estudianteHowarts;
  final bool varitaHowarts;
  final String actor;
  final List<String> actoresAlt;
  final bool vive;
  final String imagen;
  Personajes._(
      this.nombre,
      this.nombresAlt,
      this.especie,
      this.escuela,
      this.fechaNac,
      this.anioNac,
      this.mago,
      this.ancestro,
      this.colorOjos,
      this.colorCabello,
      this.varita,
      this.patronus,
      this.estudianteHowarts,
      this.varitaHowarts,
      this.actor,
      this.actoresAlt,
      this.vive,
      this.imagen);

  factory Personajes.constructor(
    String nombre,
    List<String> nombresAlt,
    String especie,
    String escuela,
    String fechaNac,
    String anioNac,
    bool mago,
    String ancestro,
    String colorOjos,
    String colorCabello,
    Map varita,
    String patronus,
    bool estudianteHowarts,
    bool varitaHowarts,
    String actor,
    List<String> actoresAlt,
    bool vive,
    String imagen,
  ) {
    if (nombre.trim().isEmpty) {
      throw PersonajeMalFormado();
    }
    return Personajes._(
        nombre,
        nombresAlt,
        especie,
        escuela,
        fechaNac,
        anioNac,
        mago,
        ancestro,
        colorOjos,
        colorCabello,
        varita,
        patronus,
        estudianteHowarts,
        varitaHowarts,
        actor,
        actoresAlt,
        vive,
        imagen);
  }

  @override
  bool operator ==(covariant Personajes other) {
    if (identical(this, other)) return true;

    return other.nombre == nombre &&
        listEquals(other.nombresAlt, nombresAlt) &&
        other.especie == especie &&
        other.escuela == escuela &&
        other.fechaNac == fechaNac &&
        other.anioNac == anioNac &&
        other.mago == mago &&
        other.ancestro == ancestro &&
        other.colorOjos == colorOjos &&
        other.colorCabello == colorCabello &&
        mapEquals(other.varita, varita) &&
        other.patronus == patronus &&
        other.estudianteHowarts == estudianteHowarts &&
        other.varitaHowarts == varitaHowarts &&
        other.actor == actor &&
        listEquals(other.actoresAlt, actoresAlt) &&
        other.vive == vive &&
        other.imagen == imagen;
  }

  @override
  int get hashCode {
    return nombre.hashCode ^
        nombresAlt.hashCode ^
        especie.hashCode ^
        escuela.hashCode ^
        fechaNac.hashCode ^
        anioNac.hashCode ^
        mago.hashCode ^
        ancestro.hashCode ^
        colorOjos.hashCode ^
        colorCabello.hashCode ^
        varita.hashCode ^
        patronus.hashCode ^
        estudianteHowarts.hashCode ^
        varitaHowarts.hashCode ^
        actor.hashCode ^
        actoresAlt.hashCode ^
        vive.hashCode ^
        imagen.hashCode;
  }
}
