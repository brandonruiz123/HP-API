import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hp_api_application/caracteristicas/verificaciones/bloc.dart';
import 'package:hp_api_application/caracteristicas/verificaciones/vistas/common_widgets.dart';

Widget generaError({required String mensaje}) {
  if (mensaje.contains('Instance')) {
    mensaje = mensaje.replaceAll('Instance of', '');
    mensaje = mensaje.replaceAll("'", '');
  }
  return TextoError(mensaje: mensaje);
}

class VistaMostrandoError extends StatelessWidget {
  final String? mensaje;
  const VistaMostrandoError({Key? key, this.mensaje}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Template(texto: '¡Error!', widget: generaError(mensaje: '$mensaje'));
  }
}

class TextoError extends StatelessWidget {
  final String? mensaje;
  const TextoError({Key? key, this.mensaje}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
            style: const TextStyle(
                fontSize: 30, fontWeight: FontWeight.bold, color: Colors.red),
            'Excepción: $mensaje'),
        SizedBox(
          height: (MediaQuery.of(context).size.width) / 8,
          width: (MediaQuery.of(context).size.width) / 8,
        ),
        Boton(texto: 'Regresar', evento: ClickRegresar())
      ],
    );
  }
}
