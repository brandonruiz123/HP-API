import 'package:flutter_test/flutter_test.dart';
import 'package:hp_api_application/caracteristicas/verificaciones/bloc.dart';
import 'package:bloc_test/bloc_test.dart';

void main() {
  group('Bloc:', () {
    blocTest<BlocVerificacion, Estado>(
      'emite el estado "PrimeraPantalla" cuando se agrega el evento "Creado"',
      build: () => BlocVerificacion(),
      act: (bloc) => bloc.add(Creado()),
      expect: () => [isA<MostrandoMenu>()],
    );
    blocTest<BlocVerificacion, Estado>(
      'emits [MyState] when MyEvent is added.',
      build: () => BlocVerificacion(),
      act: (bloc) => bloc.add(ClickMenuPersonaje()),
      expect: () => [isA<SolicitandoPersonaje>()],
    );
  });
}
