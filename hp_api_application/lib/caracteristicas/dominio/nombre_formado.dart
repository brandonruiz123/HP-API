import 'package:hp_api_application/caracteristicas/dominio/problema.dart';

class NombreFormado {
  late final String valor;

  NombreFormado._(this.valor);

  factory NombreFormado.constructor(String propuesta) {
    if (propuesta.trim().isEmpty) {
      throw NombreMalFormado();
    }
    return NombreFormado._(propuesta.toString());
  }
}
