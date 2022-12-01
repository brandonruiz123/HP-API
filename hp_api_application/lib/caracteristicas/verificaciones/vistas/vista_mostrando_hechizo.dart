import 'package:flutter/material.dart';
import 'package:hp_api_application/caracteristicas/verificaciones/bloc.dart';
import 'package:hp_api_application/caracteristicas/verificaciones/vistas/common_widgets.dart';
import '../../dominio/hechizo.dart';

List<Widget> _muestraDatos(Hechizo h) {
  List<Widget> listaWidget = [];
  listaWidget.add(const SizedBox(
    height: 30,
  ));
  listaWidget.add(Texto3(atributo: 'nombre', valor: h.nombre));
  listaWidget.add(Texto3(atributo: 'descripción', valor: h.descripcion));
  listaWidget.add(const SizedBox(height: 30));
  listaWidget.add(Boton(
    texto: 'Regresar',
    evento: ClickRegresar(),
  ));

  return listaWidget;
}

class VistaMostrandoHechizo extends StatelessWidget {
  final Hechizo hechizo;
  const VistaMostrandoHechizo({Key? key, required this.hechizo})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Template(
      texto: 'Hechizo Encontrado',
      widget: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: _muestraDatos(hechizo)),
    );
  }
}
