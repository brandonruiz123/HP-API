import 'package:flutter_test/flutter_test.dart';
import 'package:hp_api_application/caracteristicas/dominio/nombre_formado.dart';
import 'package:hp_api_application/caracteristicas/dominio/problema.dart';
import 'package:hp_api_application/caracteristicas/repositorios/repositorio_estudiante.dart';

void main() {
  group('RepositorioEstudiante', () {
    group('pruebas offline:', () {
      test('con James Potter me devuelve un estudiante', () async {
        RepositorioPruebasEstudiante rpe = RepositorioPruebasEstudiante();
        var resultado = await rpe
            .obtenerEstudiante(NombreFormado.constructor('James Potter'));
        resultado.match((l) {
          expect(false, equals(true));
        }, (r) {
          expect(r.actor, 'Will Dunn');
          expect(r.nombresAlt, contains('James Sirius Potter'));
          expect(r.anioNac, null);
          expect(r.varita?['wood'], '');
          expect(r.varita?['core'], '');
          expect(r.varita?['length'], null);
          expect(r.estudianteHowarts, true);
          expect(r.varitaHowarts, false);
        });
      });

      test('con James Patter arroja EstudianteNoEncontrado', () async {
        RepositorioPruebasEstudiante rpe = RepositorioPruebasEstudiante();
        var resultado = await rpe
            .obtenerEstudiante(NombreFormado.constructor('James Patter'));
        resultado.match((l) {
          expect(l, isA<EstudianteNoEncontrado>());
        }, (r) {
          assert(false);
        });
      });
    });
    group('pruebas online:', () {
      test('con Michael Corner me devuelve un estudiante', () async {
        RepositorioEstudianteReal rpe = RepositorioEstudianteReal();
        var resultado = await rpe
            .obtenerEstudiante(NombreFormado.constructor('Michael Corner'));
        resultado.match((l) {
          expect(false, equals(true));
        }, (r) {
          expect(r.actor, 'Ryan Nelson');
          expect(r.estudianteHowarts, true);
          expect(r.varitaHowarts, false);
        });
      });

      test('con Miguel Corner arroja EstudianteNoEncontrado', () async {
        RepositorioEstudianteReal rpe = RepositorioEstudianteReal();
        var resultado = await rpe
            .obtenerEstudiante(NombreFormado.constructor('Miguel Corner'));
        resultado.match((l) {
          expect(l, isA<EstudianteNoEncontrado>());
        }, (r) {
          assert(false);
        });
      });
    });
  });
}
