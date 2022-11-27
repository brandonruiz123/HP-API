import 'package:flutter_test/flutter_test.dart';
import 'package:hp_api_application/caracteristicas/dominio/nombre_formado.dart';
import 'package:hp_api_application/caracteristicas/dominio/problema.dart';
import 'package:hp_api_application/caracteristicas/repositorios/repositorio_personaje.dart';

void main() {
  group('RepositorioPersonaje', () {
    group('pruebas de offline: ', () {
      test('con Harry Potter me devuelve un personaje', () async {
        RepositorioPruebasPersonaje rp = RepositorioPruebasPersonaje();
        var resultado =
            await rp.obtenerPersonaje(NombreFormado.contructor('Harry Potter'));
        resultado.match((l) {
          expect(false, equals(true));
        }, (r) {
          expect(r.actor, equals('Daniel Radcliffe'));
          expect(r.nombre, equals('Harry Potter'));
          expect(r.patronus, equals('stag'));
          expect(r.anioNac, 1980);
          expect(r.vive, true);
        });
      });
      test('con Harry Popote arroja PersonajeNoEncontrado', () async {
        RepositorioPruebasPersonaje rp = RepositorioPruebasPersonaje();
        var resultado =
            await rp.obtenerPersonaje(NombreFormado.contructor('Harry Popote'));
        resultado.match((l) {
          expect(l, isA<PersonajeNoEncontrado>());
        }, (r) {
          assert(false);
        });
      });
    });
    group('pruebas online: ', () {
      test('con Hermione Granger me devuelve un personaje', () async {
        RepositorioPersonajeReal rp = RepositorioPersonajeReal();
        var resultado = await rp
            .obtenerPersonaje(NombreFormado.contructor('Hermione Granger'));
        resultado.match((l) {
          expect(false, equals(true));
        }, (r) {
          expect(r.actor, 'Emma Watson');
          expect(r.nombre, 'Hermione Granger');
          expect(r.patronus, 'otter');
          expect(r.varita?['wood'], 'vine');
          expect(r.anioNac, 1979);
          expect(r.varita?['length'], null);
          expect(r.vive, true);
        });
      });

      test('con Hermione Gringer arroja PersonajeNoEncontrado', () async {
        RepositorioPruebasPersonaje rp = RepositorioPruebasPersonaje();
        var resultado = await rp
            .obtenerPersonaje(NombreFormado.contructor('Hermione Gringer'));
        resultado.match((l) {
          expect(l, isA<PersonajeNoEncontrado>());
        }, (r) {
          assert(false);
        });
      });
    });
  });
}
