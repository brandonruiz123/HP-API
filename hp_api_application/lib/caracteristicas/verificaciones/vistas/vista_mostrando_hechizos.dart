import 'package:flutter/material.dart';
import 'package:hp_api_application/caracteristicas/verificaciones/bloc.dart';
import 'package:hp_api_application/caracteristicas/verificaciones/vistas/common_widgets.dart';
import '../../dominio/hechizo.dart';

class VistaMostrandoHechizos extends StatelessWidget {
  final List<Hechizo> listaH;
  const VistaMostrandoHechizos({Key? key, required this.listaH})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Template(
      texto: 'Personaje Encontrado',
      widget: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
                child: ListView(children: listaH.map(_buildItem).toList())),
            Boton(texto: 'Regresar', evento: ClickRegresar())
          ]),
    );
  }
}

Widget _buildItem(Hechizo h) {
  return Center(
    child: ListTile(
      title: Text(h.nombre),
      subtitle: Text("descripción: ${h.descripcion}"),
      onTap: () {},
    ),
  );
}
