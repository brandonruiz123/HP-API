import 'package:flutter/material.dart';
import 'package:hp_api_application/caracteristicas/dominio/nombre_formado.dart';
import 'package:hp_api_application/caracteristicas/verificaciones/bloc.dart';
import 'package:hp_api_application/caracteristicas/verificaciones/vistas/common_widgets.dart';

class VistaSolicitandoEstudiante extends StatefulWidget {
  const VistaSolicitandoEstudiante({Key? key}) : super(key: key);

  @override
  State<VistaSolicitandoEstudiante> createState() =>
      _VistaSolicitandoEstudianteState();
}

class _VistaSolicitandoEstudianteState
    extends State<VistaSolicitandoEstudiante> {
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
      texto: 'Busca Estudiante',
      widget: SizedBox(
        height: (MediaQuery.of(context).size.width) / 3,
        width: (MediaQuery.of(context).size.width) / 3,
        child: Column(
          children: [
            // ignore: prefer_const_constructors
            Text(
                style: const TextStyle(fontWeight: FontWeight.bold),
                'Escribe el nombre del estudiante'),
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
                        texto: 'Busca Estudiante',
                        funcion: null,
                      )),
            Container(
                child: !_usuarioValidado
                    ? null
                    : Boton(
                        texto: 'Busca Estudiante',
                        evento: EstudianteSolicitado(
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
