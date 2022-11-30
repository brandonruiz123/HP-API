import 'package:flutter_test/flutter_test.dart';
import 'package:hp_api_application/caracteristicas/dominio/problema.dart';
import 'package:hp_api_application/caracteristicas/repositorios/repositorio_json.dart';

void main() {
  group('RepositorioJson', () {
    test('con modo: offline y archivo: datos_estudiantes.json devuelve un json',
        () async {
      RepositorioPruebaJson rpj = RepositorioPruebaJson();
      var resultado = await rpj.obtenerDatos(
          'offline', './lib/caracteristicas/datos/datos_estudiantes.json');
      resultado.match((l) {
        assert(false);
      }, (r) {
        expect(r, isA<List<dynamic>>());
      });
    });
    test(
        'con modo: online y url: https://hp-api.onrender.com/api/characters devuelve un json',
        () async {
      RepositorioPruebaJson rpj = RepositorioPruebaJson();
      var resultado = await rpj.obtenerDatos(
          'online', 'https://hp-api.onrender.com/api/characters');
      resultado.match((l) {
        assert(false);
      }, (r) {
        expect(r, isA<List<dynamic>>());
      });
    });
    test('con modo: offline y ruta: "" arroja JsonNoEncontrado', () async {
      RepositorioPruebaJson rpj = RepositorioPruebaJson();
      var resultado = await rpj.obtenerDatos('offline', '');
      resultado.match((l) {
        expect(l, isA<JsonNoEncontrado>());
      }, (r) {
        assert(false);
      });
    });
    test('con modo: online y url: "" arroja JsonNoEncontrado', () async {
      RepositorioPruebaJson rpj = RepositorioPruebaJson();
      var resultado = await rpj.obtenerDatos('online', '');
      resultado.match((l) {
        expect(l, isA<JsonNoEncontrado>());
      }, (r) {
        assert(false);
      });
    });
    test(
        'con modo: offline y archivo: estonoesunjson.json arroja JsonNoEncontrado',
        () async {
      RepositorioPruebaJson rpj = RepositorioPruebaJson();
      var resultado = await rpj.obtenerDatos(
          'offline', './test/caracteristicas/datos/estonoesunjson.json');
      resultado.match((l) {
        expect(l, isA<JsonNoEncontrado>());
      }, (r) {
        assert(false);
      });
    });
    test(
        'con modo: offline y archivo: datos_erroneos_estudiantes.json arroja JsonMalFormado',
        () async {
      RepositorioPruebaJson rpj = RepositorioPruebaJson();
      var resultado = await rpj.obtenerDatos('offline',
          './test/caracteristicas/datos/datos_erroneos_estudiantes.json');
      resultado.match((l) {
        expect(l, isA<JsonMalFormado>());
      }, (r) {
        assert(false);
      });
    });
  });
}
