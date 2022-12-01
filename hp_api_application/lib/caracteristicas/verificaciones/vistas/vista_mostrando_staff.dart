import 'package:flutter/material.dart';
import 'package:hp_api_application/caracteristicas/verificaciones/vistas/common_widgets.dart';
import '../../dominio/personaje.dart';

class VistaMostrandoStaff extends StatelessWidget {
  final Personaje p;
  const VistaMostrandoStaff({Key? key, required this.p}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Template(
      texto: 'Personaje Encontrado',
      widget: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: muestraDatos(p)),
    );
  }
}
