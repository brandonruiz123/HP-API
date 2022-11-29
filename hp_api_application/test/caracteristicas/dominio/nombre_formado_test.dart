import 'package:flutter_test/flutter_test.dart';
import 'package:hp_api_application/caracteristicas/dominio/nombre_formado.dart';
import 'package:hp_api_application/caracteristicas/dominio/problema.dart';

void main() {
  group('NombreFormado:', () {
    test('nombre que no este vacío no arroja error', () {
      NombreFormado n1 = NombreFormado.constructor('Brandon');
      expect(n1.valor, 'Brandon');
    });

    test('nombre vacío o con solo espacios arroja NombreMalFormado', () {
      expect(() => NombreFormado.constructor('    '),
          throwsA(isA<NombreMalFormado>()));
    });
  });
}
