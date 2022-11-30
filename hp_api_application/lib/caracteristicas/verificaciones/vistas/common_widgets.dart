import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc.dart';

class Template extends StatelessWidget {
  final String texto;
  final Widget widget;
  const Template({super.key, required this.texto, required this.widget});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HP-API',
      home: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text(texto),
          ),
        ),
        body: Center(child: widget),
      ),
    );
  }
}

class Boton extends StatelessWidget {
  final String? texto;
  final Evento evento;
  const Boton({super.key, this.texto, required this.evento});

  @override
  Widget build(BuildContext context) {
    final blocVerificacion = context.read<BlocVerificacion>();
    return SizedBox(
      width: 800,
      child: Padding(
        padding: const EdgeInsets.all(2),
        child: TextButton(
          style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
              backgroundColor: MaterialStateProperty.all<Color>(Colors.blue)),
          onPressed: () {
            blocVerificacion.add(evento);
          },
          child: Center(
              child: Text(style: const TextStyle(fontSize: 30), '$texto')),
        ),
      ),
    );
  }
}

class BotonConFn extends StatelessWidget {
  final String? texto;
  final Function? funcion;
  const BotonConFn({super.key, this.texto, this.funcion});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 800,
      child: Padding(
        padding: const EdgeInsets.all(2),
        child: TextButton(
          style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
              backgroundColor: MaterialStateProperty.all<Color>(Colors.blue)),
          onPressed: () {
            funcion;
          },
          child: Center(
              child: Text(style: const TextStyle(fontSize: 30), '$texto')),
        ),
      ),
    );
  }
}
