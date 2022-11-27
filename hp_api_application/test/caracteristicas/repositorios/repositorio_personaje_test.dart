import 'package:flutter_test/flutter_test.dart';
import 'package:hp_api_application/caracteristicas/dominio/nombre_formado.dart';
import 'package:hp_api_application/caracteristicas/repositorios/repositorio_personaje.dart';

void main() {
  group('pruebas de funcionalidad: ', () {
    test('con Harry Potter me devuelve un personaje', () {
      RepositorioPruebasPersonaje rp = RepositorioPruebasPersonaje();
      var resultado =
          rp.obtenerPersonaje(NombreFormado.contructor('Harry Potter'));
      resultado.match((l) {
        expect(false, equals(true));
      }, (r) {
        expect(r.actor, equals('Daniel Radcliffe'));
        expect(r.nombre, equals('Harry Potter'));
        expect(r.patronus, equals('stag'));
      });
    });
  });

  group('pruebas manejo de errores', () {});
}
