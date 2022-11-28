import 'package:flutter_test/flutter_test.dart';
import 'package:hp_api_application/caracteristicas/dominio/nombre_formado.dart';
import 'package:hp_api_application/caracteristicas/dominio/problema.dart';
import 'package:hp_api_application/caracteristicas/repositorios/repositorio_staff.dart';

void main() {
  group('RepositorioStaff', () {
    group('pruebas online: ', () {
      test('con Minerva McGonagall me devuelve un Staff', () async {
        RepositorioStaffReal rps = RepositorioStaffReal();
        var resultado = await rps
            .obtenerStaff(NombreFormado.contructor('Minerva McGonagall'));
        resultado.match((l) {
          expect(false, true);
        }, (r) {
          expect(r.actor, 'Dame Maggie Smith');
          expect(r.anioNac, 1925);
          expect(r.patronus, 'tabby cat');
          expect(r.estudianteHowarts, false);
          expect(r.varitaHowarts, true);
        });
      });
      test('con Minerva Mcdonalds me devuelve StaffNoEncontrado', () async {
        RepositorioStaffReal rps = RepositorioStaffReal();
        var resultado = await rps
            .obtenerStaff(NombreFormado.contructor('Minerva Mcdonalds'));
        resultado.match((l) {
          expect(l, isA<StaffNoEncontrado>());
        }, (r) {
          assert(false);
        });
      });
    });
    group('pruebas offline:', () {
      test('con Charity Burbage me devuelve un Staff', () async {
        RepositorioPruebasStaff rps = RepositorioPruebasStaff();
        var resultado =
            await rps.obtenerStaff(NombreFormado.contructor('Charity Burbage'));
        resultado.match((l) {
          expect(false, true);
        }, (r) {
          expect(r.actor, 'Carolyn Pickles');
          expect(r.estudianteHowarts, false);
          expect(r.varitaHowarts, true);
        });
      });
      test('con Cheryl Barbas me devuelve StaffNoEncontrado', () async {
        RepositorioPruebasStaff rps = RepositorioPruebasStaff();
        var resultado =
            await rps.obtenerStaff(NombreFormado.contructor('Cheryl Barbas'));
        resultado.match((l) {
          expect(l, isA<StaffNoEncontrado>());
        }, (r) {
          assert(false);
        });
      });
    });
  });
}
