import 'package:flutter/material.dart';
import 'package:hp_api_application/caracteristicas/dominio/nombre_formado.dart';
import 'package:hp_api_application/caracteristicas/verificaciones/bloc.dart';
import 'package:hp_api_application/caracteristicas/verificaciones/vistas/common_widgets.dart';

class VistaSolicitandoEscuela extends StatefulWidget {
  const VistaSolicitandoEscuela({Key? key}) : super(key: key);

  @override
  State<VistaSolicitandoEscuela> createState() =>
      _VistaSolicitandoEscuelaState();
}

class _VistaSolicitandoEscuelaState extends State<VistaSolicitandoEscuela> {
  bool _usuarioValidado = false;
  late final TextEditingController controlador1;
  late final TextEditingController controlador2;

  @override
  void initState() {
    controlador1 = TextEditingController();
    controlador1.addListener(escuchadorValidador);
    controlador2 = TextEditingController();
    controlador2.addListener(escuchadorValidador);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Template(
      texto: 'Busca Personaje de una Escuela',
      widget: SizedBox(
        height: (MediaQuery.of(context).size.width) / 3,
        width: (MediaQuery.of(context).size.width) / 3,
        child: Column(
          children: [
            // ignore: prefer_const_constructors
            Text(
                style: const TextStyle(fontWeight: FontWeight.bold),
                'Escribe el nombre de la Escuela'),
            TextField(
              controller: controlador1,
            ),
            const SizedBox(
              height: 10,
            ),
            // ignore: prefer_const_constructors
            Text(
                // ignore: prefer_const_constructors
                style: TextStyle(fontWeight: FontWeight.bold),
                'Escribe el nombre del Personaje'),
            TextField(
              controller: controlador2,
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
                child: _usuarioValidado
                    ? null
                    : const BotonConFn(
                        texto: 'Busca Personaje',
                        funcion: null,
                      )),
            Container(
                child: !_usuarioValidado
                    ? null
                    : Boton(
                        texto: 'Busca Personaje',
                        evento: EscuelaSolicitada(
                            escuela:
                                NombreFormado.constructor(controlador1.text),
                            nombre:
                                NombreFormado.constructor(controlador2.text)))),
          ],
        ),
      ),
    );
  }

  void escuchadorValidador() {
    setState(() {
      try {
        NombreFormado.constructor(controlador1.text);
        NombreFormado.constructor(controlador2.text);
        _usuarioValidado = true;
      } catch (e) {
        _usuarioValidado = false;
      }
    });
  }
}
