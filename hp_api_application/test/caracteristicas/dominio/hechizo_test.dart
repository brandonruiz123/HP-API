import 'package:flutter_test/flutter_test.dart';
import 'package:hp_api_application/caracteristicas/dominio/hechizo.dart';
import 'package:hp_api_application/caracteristicas/dominio/problema.dart';

void main() {
  group('Hechizo', () {
    test('nombre distinto Hechizo distinto', () {
      Hechizo h1 =
          Hechizo.constructor(nombre: 'mihechizo', descripcion: 'hechizo1');
      Hechizo h2 =
          Hechizo.constructor(nombre: 'hechizo', descripcion: 'hechizo2');
      expect(h1 == h2, false);
    });
    test(
        'si el nombre esta vacío o con solo espacios me arroja HechizoMalFormado',
        () {
      expect(() => Hechizo.constructor(nombre: '    ', descripcion: 'hechizo'),
          throwsA(isA<HechizoMalFormado>()));
    });
    test(
        'si la descripción está vacía o con solo espacios me arroja HechizoMalFormado',
        () {
      expect(() => Hechizo.constructor(nombre: 'hechizo', descripcion: ''),
          throwsA(isA<HechizoMalFormado>()));
    });
  });
}
