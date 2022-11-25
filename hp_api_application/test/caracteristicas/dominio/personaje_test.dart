import 'package:flutter_test/flutter_test.dart';
import 'package:hp_api_application/caracteristicas/dominio/personaje.dart';
import 'package:hp_api_application/caracteristicas/dominio/problema.dart';

void main() {
  group('funcionalidad:', () {
    test('nombre distinto, personaje distinto', () {
      Personaje p1 = Personaje.constructor(nombre: 'brandon');
      Personaje p2 = Personaje.constructor(nombre: 'roberto');
      expect(p1 == p2, false);
    });

    test('puedo crear un personaje con atributos opcionales', () {
      Personaje p1 =
          Personaje.constructor(nombre: 'brandon', actor: 'Brandon Ruiz');
      expect(p1.actor, 'Brandon Ruiz');
    });
  });

  group('manejo de exepciones (problemas):', () {
    test('nombre vacío arroja PersonajeMalFormado', () {
      expect(() => Personaje.constructor(nombre: ''),
          throwsA(isA<PersonajeMalFormado>()));
    });

    test('nombre que solo contiene espacios arroja PersonajeMalFormado', () {
      expect(() => Personaje.constructor(nombre: '        '),
          throwsA(isA<PersonajeMalFormado>()));
    });
  });
}
