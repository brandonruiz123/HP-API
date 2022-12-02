import 'package:flutter_test/flutter_test.dart';
import 'package:hp_api_application/caracteristicas/dominio/hechizo.dart';
import 'package:hp_api_application/caracteristicas/repositorios/repositorio_hechizos.dart';
import 'package:hp_api_application/caracteristicas/repositorios/repositorio_json.dart';

void main() {
  group('RepositorioHechizos', () {
    test('obtenerHechizos me devuelve una lista de hechizos', () async {
      RepositorioPruebaJson rpj = RepositorioPruebaJson();
      RepositorioHechizosReal rpr = RepositorioHechizosReal(rpj);
      var resultado = await rpr.obtenerHechizos();
      resultado.match((l) {
        assert(false);
      }, (r) {
        expect(r, isA<List<Hechizo>>());
        expect(r.length, 77);
      });
    });
  });
}
