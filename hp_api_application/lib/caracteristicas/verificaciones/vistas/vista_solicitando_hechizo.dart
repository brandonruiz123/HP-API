import 'package:flutter/material.dart';
import 'package:hp_api_application/caracteristicas/dominio/nombre_formado.dart';
import 'package:hp_api_application/caracteristicas/verificaciones/bloc.dart';
import 'package:hp_api_application/caracteristicas/verificaciones/vistas/common_widgets.dart';

class VistaSolicitandoHechizo extends StatefulWidget {
  const VistaSolicitandoHechizo({Key? key}) : super(key: key);

  @override
  State<VistaSolicitandoHechizo> createState() =>
      _VistaSolicitandoHechizoState();
}

class _VistaSolicitandoHechizoState extends State<VistaSolicitandoHechizo> {
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
      texto: 'Busca Hechizo',
      widget: SizedBox(
        height: (MediaQuery.of(context).size.width) / 3,
        width: (MediaQuery.of(context).size.width) / 3,
        child: Column(
          children: [
            // ignore: prefer_const_constructors
            Text(
                style: const TextStyle(fontWeight: FontWeight.bold),
                'Escribe el nombre del Hechizo'),
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
                        texto: 'Busca Hechizo',
                        funcion: null,
                      )),
            Container(
                child: !_usuarioValidado
                    ? null
                    : Boton(
                        texto: 'Busca Hechizo',
                        evento: HechizoSolicitado(
                            NombreFormado.constructor(controlador.text)))),
            const SizedBox(height: 10),
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
