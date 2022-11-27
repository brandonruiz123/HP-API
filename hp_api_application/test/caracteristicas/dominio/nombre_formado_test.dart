import 'package:flutter_test/flutter_test.dart';
import 'package:hp_api_application/caracteristicas/dominio/nombre_formado.dart';
import 'package:hp_api_application/caracteristicas/dominio/problema.dart';

void main() {
  test('nombre que no este vacio no arroja error', () {
    NombreFormado n1 = NombreFormado.contructor('Brandon');
    expect(n1.nombre, 'Brandon');
  });

  test('nombre vacío o con solo espacios arroja NombreMalFormado', () {
    expect(() => NombreFormado.contructor('    '),
        throwsA(isA<NombreMalFormado>()));
  });
}
