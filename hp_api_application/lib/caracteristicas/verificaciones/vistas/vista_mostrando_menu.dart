import 'package:flutter/material.dart';
import 'package:hp_api_application/caracteristicas/verificaciones/vistas/common_widgets.dart';

import '../bloc.dart';

List<Widget> loopButtons() {
  List<Widget> listaWidgets = [];
  for (var i = 0; i < 6; i++) {
    switch (i) {
      case 0:
        listaWidgets.add(Boton(
          texto: 'Buscar Personaje',
          evento: ClickMenuPersonaje(),
        ));
        break;
      case 1:
        listaWidgets.add(Boton(
          texto: 'Buscar Estudiante',
          evento: ClickMenuEstudiante(),
        ));
        break;
      case 2:
        listaWidgets.add(Boton(
          texto: 'Buscar Escuela',
          evento: ClickMenuEscuela(),
        ));
        break;
      case 3:
        listaWidgets.add(Boton(
          texto: 'Buscar Staff',
          evento: ClickMenuStaff(),
        ));
        break;
      case 4:
        listaWidgets.add(Boton(
          texto: 'Buscar Hechizo',
          evento: ClickMenuHechizo(),
        ));
        break;
      case 5:
        listaWidgets.add(Boton(
          texto: 'Muestra Hechizos',
          evento: ClickMenuHechizos(),
        ));
        break;
    }
    listaWidgets.add(const SizedBox(
      height: 40,
    ));
  }
  return listaWidgets;
}

class VistaMostrandoMenu extends StatelessWidget {
  const VistaMostrandoMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Template(texto: 'Menu', widget: Botones());
  }
}

class Botones extends StatelessWidget {
  const Botones({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: loopButtons(),
    );
  }
}
