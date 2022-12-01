import 'package:flutter/material.dart';
import 'package:hp_api_application/caracteristicas/dominio/nombre_formado.dart';
import 'package:hp_api_application/caracteristicas/verificaciones/bloc.dart';
import 'package:hp_api_application/caracteristicas/verificaciones/vistas/common_widgets.dart';

class VistaSolicitandoPersonaje extends StatefulWidget {
  const VistaSolicitandoPersonaje({Key? key}) : super(key: key);

  @override
  State<VistaSolicitandoPersonaje> createState() =>
      _VistaSolicitandoPersonajeState();
}

class _VistaSolicitandoPersonajeState extends State<VistaSolicitandoPersonaje> {
  bool _usuarioValidado = false;
  late final TextEditingController controlador;

  @override
  void initState() {
    controlador = TextEditingController();
    controlador.addListener(escuchadorValidador);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Template(
      texto: 'Busca Personaje',
      widget: SizedBox(
        height: (MediaQuery.of(context).size.width) / 3,
        width: (MediaQuery.of(context).size.width) / 3,
        child: Column(
          children: [
            // ignore: prefer_const_constructors
            Text(
                style: const TextStyle(fontWeight: FontWeight.bold),
                'Escribe el nombre del personaje'),
            TextField(
              controller: controlador,
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
                        evento: PersonajeSolicitado(
                            NombreFormado.constructor(controlador.text)))),
                            SizedBox(height: 10),
            Boton(texto: 'Regresar', evento: ClickRegresar()),
          ],
        ),
      ),
    );
  }

  void escuchadorValidador() {
    setState(() {
      try {
        NombreFormado.constructor(controlador.text);
        _usuarioValidado = true;
      } catch (e) {
        _usuarioValidado = false;
      }
    });
  }
}
