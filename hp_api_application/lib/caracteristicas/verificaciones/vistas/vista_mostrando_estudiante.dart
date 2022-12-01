import 'package:flutter/material.dart';
import 'package:hp_api_application/caracteristicas/verificaciones/vistas/common_widgets.dart';
import '../../dominio/personaje.dart';

class VistaMostrandoEstudiante extends StatelessWidget {
  final Personaje p;
  const VistaMostrandoEstudiante({Key? key, required this.p}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Template(
      texto: 'Estudiante Encontrado',
      widget: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: muestraDatos(p)),
    );
  }
}
