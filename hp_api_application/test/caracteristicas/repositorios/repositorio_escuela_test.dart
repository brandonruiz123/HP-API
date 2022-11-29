import 'package:flutter_test/flutter_test.dart';
import 'package:hp_api_application/caracteristicas/dominio/nombre_formado.dart';
import 'package:hp_api_application/caracteristicas/dominio/problema.dart';
import 'package:hp_api_application/caracteristicas/repositorios/repositorio_escuela.dart';
import 'package:hp_api_application/caracteristicas/repositorios/repositorio_json.dart';

void main() {
  group('RepositorioEscuela', () {
    group('pruebas online:', () {
      test('Con Ron Weasley y Gryffindor devuelve un Personaje', () async {
        RepositorioPruebaJson rpj = RepositorioPruebaJson();
        RepositorioEscuelaReal rpe = RepositorioEscuelaReal(rpj);
        var resultado = await rpe.obtenerEscuela(
            NombreFormado.constructor('Gryffindor'),
            NombreFormado.constructor('Ron Weasley'));
        resultado.match((l) {
          expect(false, true);
        }, (r) {
          expect(r.actor, 'Rupert Grint');
          expect(r.anioNac, 1980);
          expect(r.mago, true);
          expect(r.escuela, 'Gryffindor');
        });
      });
      test('Con Run Wisli y Gryffindor arroja EstudianteNoEncontrado',
          () async {
        RepositorioPruebaJson rpj = RepositorioPruebaJson();
        RepositorioEscuelaReal rpe = RepositorioEscuelaReal(rpj);
        var resultado = await rpe.obtenerEscuela(
            NombreFormado.constructor('Gryffindor'),
            NombreFormado.constructor('Run Wisli'));
        resultado.match((l) {
          expect(l, isA<PersonajeNoEncontrado>());
        }, (r) {
          assert(false);
        });
      });
      test('Con Ron Weasley y Greyfindor arroja EscuelaNoEncontrada', () async {
        RepositorioPruebaJson rpj = RepositorioPruebaJson();
        RepositorioEscuelaReal rpe = RepositorioEscuelaReal(rpj);
        var resultado = await rpe.obtenerEscuela(
            NombreFormado.constructor('Greyfindor'),
            NombreFormado.constructor('Ron Weasley'));
        resultado.match((l) {
          expect(l, isA<EscuelaNoEncontrada>());
        }, (r) {
          assert(false);
        });
      });
    });
    group('pruebas offline:', () {
      test('con Eloise Midgen y Gryffindor devuelve un Personaje', () async {
        RepositorioPruebaJson rpj = RepositorioPruebaJson();
        RepositorioPruebasEscuela rpe = RepositorioPruebasEscuela(rpj);
        var resultado = await rpe.obtenerEscuela(
            NombreFormado.constructor('Gryffindor'),
            NombreFormado.constructor('Eloise Midgen'));
        resultado.match((l) {
          expect(false, true);
        }, (r) {
          expect(r.actor, 'Samantha Clinch');
          expect(r.genero, 'female');
          expect(r.escuela, 'Gryffindor');
        });
      });
      test('con Eluis Migen y Gryffindor arroja PersonajeNoEncontrado',
          () async {
        RepositorioPruebaJson rpj = RepositorioPruebaJson();
        RepositorioPruebasEscuela rpe = RepositorioPruebasEscuela(rpj);
        var resultado = await rpe.obtenerEscuela(
            NombreFormado.constructor('Gryffindor'),
            NombreFormado.constructor('Eluis Migen'));
        resultado.match((l) {
          expect(l, isA<PersonajeNoEncontrado>());
        }, (r) {
          assert(false);
        });
      });
      test('con Eloise Midgen y Greyfindor arroja EscuelaNoEncontrada',
          () async {
        RepositorioPruebaJson rpj = RepositorioPruebaJson();
        RepositorioPruebasEscuela rpe = RepositorioPruebasEscuela(rpj);
        var resultado = await rpe.obtenerEscuela(
            NombreFormado.constructor('Greyfindor'),
            NombreFormado.constructor('Eluis Migen'));
        resultado.match((l) {
          expect(l, isA<EscuelaNoEncontrada>());
        }, (r) {
          assert(false);
        });
      });
    });
  });
}
