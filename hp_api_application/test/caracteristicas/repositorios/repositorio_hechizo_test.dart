import 'package:flutter_test/flutter_test.dart';
import 'package:hp_api_application/caracteristicas/dominio/hechizo.dart';
import 'package:hp_api_application/caracteristicas/dominio/nombre_formado.dart';
import 'package:hp_api_application/caracteristicas/dominio/problema.dart';
import 'package:hp_api_application/caracteristicas/repositorios/repositorio_hechizo.dart';
import 'package:hp_api_application/caracteristicas/repositorios/repositorio_json.dart';

void main() {
  group('RepositorioHechizos', () {
    group('pruebas online:', () {
      test('con Spongify me regresa un Hechizo', () async {
        RepositorioPruebaJson rpj = RepositorioPruebaJson();
        RepositorioHechizoReal rph = RepositorioHechizoReal(rpj);
        var resultado =
            await rph.obtenerHechizo(NombreFormado.constructor('Spongify'));
        resultado.match((l) {
          assert(false);
        }, (r) {
          expect(r, isA<Hechizo>());
          expect(r.descripcion, 'Softens the target');
        });
      });
      test('con Esponja arroja HechizoNoEncontrado', () async {
        RepositorioPruebaJson rpj = RepositorioPruebaJson();
        RepositorioHechizoReal rph = RepositorioHechizoReal(rpj);
        var resultado =
            await rph.obtenerHechizo(NombreFormado.constructor('Esponja'));
        resultado.match((l) {
          expect(l, isA<HechizoNoEncontrado>());
        }, (r) {
          assert(false);
        });
      });
    });
    group('pruebas offline:', () {
      test('con Aberto me regresa un Hechizo', () async {
        RepositorioPruebaJson rpj = RepositorioPruebaJson();
        RepositorioPruebaHechizo rph = RepositorioPruebaHechizo(rpj);
        var resultado =
            await rph.obtenerHechizo(NombreFormado.constructor('Aberto'));
        resultado.match((l) {
          assert(false);
        }, (r) {
          expect(r, isA<Hechizo>());
          expect(r.descripcion, 'Opens locked doors');
        });
      });
      test('con Abierto arroja HechizoNoEncontrado', () async {
        RepositorioPruebaJson rpj = RepositorioPruebaJson();
        RepositorioPruebaHechizo rph = RepositorioPruebaHechizo(rpj);
        var resultado =
            await rph.obtenerHechizo(NombreFormado.constructor('Abierto'));
        resultado.match((l) {
          expect(l, isA<HechizoNoEncontrado>());
        }, (r) {
          assert(false);
        });
      });
    });
  });
}
