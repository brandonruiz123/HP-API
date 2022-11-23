//Aqui tendremos los estados y eventos de la apliación

import 'package:bloc/bloc.dart';

class Estado {}

class Creandose extends Estado {}

class PrimeraPantalla extends Estado {}

class Evento {}

class Creado extends Evento {}

class BlocVerificacion extends Bloc<Evento, Estado> {
  BlocVerificacion() : super(Creandose()) {
    on<Creado>((event, emit) {
      emit(PrimeraPantalla());
    });
  }
}
