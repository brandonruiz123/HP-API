import 'package:hp_api_application/caracteristicas/dominio/problema.dart';

class NombreFormado {
  late final String nombre;

  NombreFormado._(this.nombre);

  factory NombreFormado.contructor(String propuesta) {
    if (propuesta.trim().isEmpty) {
      throw NombreMalFormado();
    }
    return NombreFormado._(propuesta);
  }
}
