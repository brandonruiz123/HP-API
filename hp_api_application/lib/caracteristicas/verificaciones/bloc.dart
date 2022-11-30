//Aqui tendremos los estados y eventos de la apliación

import 'package:bloc/bloc.dart';

class Estado {}

class Creandose extends Estado {}

class MostrandoMenu extends Estado{}

class SolicitandoPersonaje extends Estado {}

class MostrandoPersonaje extends Estado {}

class Evento {}

class Creado extends Evento {}

class ClickMenuPersonaje extends Evento{}

class PersonajeSolicitado extends Evento{}

class BlocVerificacion extends Bloc<Evento, Estado> {
  BlocVerificacion() : super(Creandose()) {
    on<Creado>((event, emit) {
      emit(MostrandoMenu());
    });
    on<ClickMenuPersonaje>((event, emit) {
      emit(SolicitandoPersonaje());
    });
  }
}
