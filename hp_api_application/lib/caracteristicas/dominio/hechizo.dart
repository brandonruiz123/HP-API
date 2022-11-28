import 'package:hp_api_application/caracteristicas/dominio/problema.dart';

class Hechizo {
  final String nombre;
  final String? descripcion;

  Hechizo._(this.nombre, this.descripcion);

  factory Hechizo.constructor(
      {required String nombre, String? descripcion}) {
    if (nombre.trim().isEmpty) {
      throw HechizoMalFormado();
    }
    return Hechizo._(nombre, descripcion);
  }
  @override
  bool operator ==(covariant Hechizo other) {
    if (identical(this, other)) return true;

    return other.nombre == nombre && other.descripcion == descripcion;
  }

  @override
  int get hashCode {
    return nombre.hashCode ^ descripcion.hashCode;
  }
}
