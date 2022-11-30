//Aqui tendremos los estados y eventos de la apliación

import 'package:bloc/bloc.dart';

class Estado {}

class Creandose extends Estado {}

class MostrandoMenu extends Estado {}

class SolicitandoPersonaje extends Estado {}

class MostrandoPersonaje extends Estado {}

class SolicitandoEstudiante extends Estado {}

class MostrandoEstudiante extends Estado {}

class SolicitandoEscuela extends Estado {}

class MostrandoEscuela extends Estado {}

class SolicitandoStaff extends Estado {}

class MostrandoStaff extends Estado {}

class SolicitandoHechizo extends Estado {}

class Evento {}

class Creado extends Evento {}

class ClickMenuPersonaje extends Evento {}

class PersonajeSolicitado extends Evento {}

class ClickMenuEstudiante extends Evento {}

class EstudianteSolicitado extends Evento {}

class ClickMenuEscuela extends Evento {}

class EscuelaSolicitada extends Evento {}

class ClickMenuStaff extends Evento {}

class StaffSolicitado extends Evento {}

class ClickMenuHechizo extends Evento {}

class HechizoSolicitado extends Evento {}

class BlocVerificacion extends Bloc<Evento, Estado> {
  BlocVerificacion() : super(Creandose()) {
    on<Creado>((event, emit) {
      emit(MostrandoMenu());
    });
    on<ClickMenuPersonaje>((event, emit) {
      emit(SolicitandoPersonaje());
    });
    on<ClickMenuEstudiante>((event, emit) {
      emit(SolicitandoEstudiante());
    });
    on<ClickMenuEscuela>((event, emit) {
      emit(SolicitandoEscuela());
    });
    on<ClickMenuStaff>((event, emit) {
      emit(SolicitandoStaff());
    });
    on<ClickMenuHechizo>((event, emit) {
      emit(SolicitandoHechizo());
    });
  }
}
