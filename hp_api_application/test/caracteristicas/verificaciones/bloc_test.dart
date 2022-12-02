import 'package:flutter_test/flutter_test.dart';
import 'package:hp_api_application/caracteristicas/verificaciones/bloc.dart';
import 'package:bloc_test/bloc_test.dart';

void main() {
  group('Bloc:', () {
    blocTest<BlocVerificacion, Estado>(
      'emite el estado "MostrandoMenu" cuando se agrega el evento "Creado"',
      build: () => BlocVerificacion(),
      act: (bloc) => bloc.add(Creado()),
      expect: () => [isA<MostrandoMenu>()],
    );
    blocTest<BlocVerificacion, Estado>(
      'emite el estado "SolicitandoPersonaje" cuando se agrega el evento ClickMenuPersonaje',
      build: () => BlocVerificacion(),
      act: (bloc) => bloc.add(ClickMenuPersonaje()),
      expect: () => [isA<SolicitandoPersonaje>()],
    );
  });
}
