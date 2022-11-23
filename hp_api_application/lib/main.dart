import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hp_api_application/caracteristicas/verificaciones/bloc.dart';

import 'caracteristicas/verificaciones/vistas/vista_creandose.dart';

void main() {
  runApp(const AplicacionInyectada());
}

class AplicacionInyectada extends StatelessWidget {
  const AplicacionInyectada({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BlocVerificacion(),
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

          return const Center(child: Text('Error 404'));
        }),
      ),
    );
  }
}
