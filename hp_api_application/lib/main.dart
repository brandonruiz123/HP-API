import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hp_api_application/caracteristicas/verificaciones/bloc.dart';
import 'package:hp_api_application/caracteristicas/verificaciones/vistas/vista_mostrando_error.dart';
import 'package:hp_api_application/caracteristicas/verificaciones/vistas/vista_mostrando_escuela.dart';
import 'package:hp_api_application/caracteristicas/verificaciones/vistas/vista_mostrando_estudiante.dart';
import 'package:hp_api_application/caracteristicas/verificaciones/vistas/vista_mostrando_menu.dart';
import 'package:hp_api_application/caracteristicas/verificaciones/vistas/vista_mostrando_personaje.dart';
import 'package:hp_api_application/caracteristicas/verificaciones/vistas/vista_solicitando_estudiante.dart';
import 'package:hp_api_application/caracteristicas/verificaciones/vistas/vista_solicitando_escuela.dart';
import 'package:hp_api_application/caracteristicas/verificaciones/vistas/vista_solicitando_personaje.dart';
import 'caracteristicas/verificaciones/vistas/vista_creandose.dart';

void main() {
  runApp(const AplicacionInyectada());
}

class AplicacionInyectada extends StatelessWidget {
  const AplicacionInyectada({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        BlocVerificacion blocVerificacion = BlocVerificacion();
        Future.delayed(const Duration(seconds: 2), () {
          blocVerificacion.add(Creado());
        });
        return blocVerificacion;
      },
      child: const Aplicacion(),
    );
  }
}

class Aplicacion extends StatelessWidget {
  const Aplicacion({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Builder(builder: (context) {
          var estado = context.watch<BlocVerificacion>().state;
          if (estado is Creandose) {
            return const VistaCreandose();
          }
          if (estado is MostrandoMenu) {
            return const VistaMostrandoMenu();
          }
          if (estado is SolicitandoPersonaje) {
            return const VistaSolicitandoPersonaje();
          }
          if (estado is MostrandoPersonaje) {
            return VistaMostrandoPersonaje(p: estado.p);
          }
          if (estado is SolicitandoEstudiante) {
            return const VistaSolicitandoEstudiante();
          }
          if (estado is MostrandoEstudiante) {
            return VistaMostrandoEstudiante(p: estado.p);
          }
          if (estado is SolicitandoEscuela) {
            return const VistaSolicitandoEscuela();
          }
          if (estado is MostrandoEscuela) {
            return VistaMostrandoEscuela(p: estado.p);
          }
          if (estado is MostrandoError) {
            return VistaMostrandoError(mensaje: estado.mensaje);
          }
          return const Center(child: Text('Error 404'));
        }),
      ),
    );
  }
}
