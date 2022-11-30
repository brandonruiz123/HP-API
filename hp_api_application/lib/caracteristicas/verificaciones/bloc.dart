//Aqui tendremos los estados y eventos de la apliación

import 'package:bloc/bloc.dart';
import 'package:hp_api_application/caracteristicas/dominio/nombre_formado.dart';
import 'package:hp_api_application/caracteristicas/dominio/personaje.dart';
import 'package:hp_api_application/caracteristicas/repositorios/repositorio_json.dart';
import 'package:hp_api_application/caracteristicas/repositorios/repositorio_personaje.dart';

import '../repositorios/repositorio_estudiante.dart';

class Estado {}

class Creandose extends Estado {}

class MostrandoMenu extends Estado {}

class SolicitandoPersonaje extends Estado {}

class MostrandoPersonaje extends Estado {
  Personaje p;
  MostrandoPersonaje(this.p);
}

class SolicitandoEstudiante extends Estado {}

class MostrandoEstudiante extends Estado {
  Personaje p;
  MostrandoEstudiante(this.p);
}

class SolicitandoEscuela extends Estado {}

class MostrandoEscuela extends Estado {}

class SolicitandoStaff extends Estado {}

class MostrandoStaff extends Estado {}

class SolicitandoHechizo extends Estado {}

class MostrandoError extends Estado {
  String? mensaje;
  MostrandoError({this.mensaje});
}

class Evento {}

class Creado extends Evento {}

class ClickMenuPersonaje extends Evento {}

class PersonajeSolicitado extends Evento {
  NombreFormado nombre;
  PersonajeSolicitado(this.nombre);
}

class ClickMenuEstudiante extends Evento {}

class EstudianteSolicitado extends Evento {
  NombreFormado nombre;
  EstudianteSolicitado(this.nombre);
}

class ClickMenuEscuela extends Evento {}

class EscuelaSolicitada extends Evento {}

class ClickMenuStaff extends Evento {}

class StaffSolicitado extends Evento {}

class ClickMenuHechizo extends Evento {}

class HechizoSolicitado extends Evento {}

class ClickRegresar extends Evento {}

RepositorioPruebaJson _rpj = RepositorioPruebaJson();
RepositorioPersonajeReal _rp = RepositorioPersonajeReal(_rpj);
RepositorioEstudianteReal _rpe = RepositorioEstudianteReal(_rpj);

class BlocVerificacion extends Bloc<Evento, Estado> {
  BlocVerificacion() : super(Creandose()) {
    on<Creado>((event, emit) {
      emit(MostrandoMenu());
    });
    on<ClickRegresar>((event, emit) {
      emit(MostrandoMenu());
    });
    on<ClickMenuPersonaje>((event, emit) {
      emit(SolicitandoPersonaje());
    });
    on<PersonajeSolicitado>((event, emit) async {
      var resultado = await _rp.obtenerPersonaje(event.nombre);
      resultado.match((l) {
        emit(MostrandoError(mensaje: l.toString()));
      }, (r) {
        emit(MostrandoPersonaje(r));
      });
    });
    on<ClickMenuEstudiante>((event, emit) {
      emit(SolicitandoEstudiante());
    });
    on<EstudianteSolicitado>((event, emit) async {
      var resultado = await _rpe.obtenerEstudiante(event.nombre);
      resultado.match((l) {
        emit(MostrandoError(mensaje: l.toString()));
      }, (r) {
        emit(MostrandoEstudiante(r));
      });
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
