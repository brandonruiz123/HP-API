// ignore_for_file: curly_braces_in_flow_control_structures

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../dominio/personaje.dart';
import '../bloc.dart';

List<Widget> muestraDatos(Personaje p) {
  List<Widget> listaWidget = [];
  listaWidget.add(const SizedBox(
    height: 30,
  ));
  listaWidget.add(Texto(atributo: 'nombre', valor: p.nombre));
  if (p.nombresAlt != null) {
    if (p.nombresAlt!.isNotEmpty) {
      for (var i = 0; i < p.nombresAlt!.length; i++) {
        listaWidget.add(
            Texto(atributo: 'nombre alterno${i + 1}', valor: p.nombresAlt![i]));
      }
    }
  }
  if (p.especie.toString().isNotEmpty)
    listaWidget.add(Texto(atributo: 'especie', valor: p.especie.toString()));
  if (p.genero.toString().isNotEmpty)
    listaWidget.add(Texto(atributo: 'genero', valor: p.genero.toString()));
  if (p.escuela.toString().isNotEmpty)
    listaWidget.add(Texto(atributo: 'escuela', valor: p.escuela.toString()));
  if (p.fechaNac.toString().isNotEmpty)
    listaWidget.add(
        Texto(atributo: 'fecha de nacimiento', valor: p.fechaNac.toString()));
  if (p.anioNac != null) {
    listaWidget
        .add(Texto(atributo: 'año de nacimiento', valor: p.anioNac.toString()));
  }
  listaWidget.add(Texto(atributo: 'es mago', valor: p.mago.toString()));
  if (p.ancestro.toString().isNotEmpty)
    listaWidget.add(Texto(atributo: 'ancestro', valor: p.ancestro.toString()));
  if (p.colorOjos.toString().isNotEmpty)
    listaWidget
        .add(Texto(atributo: 'color de ojos', valor: p.colorOjos.toString()));
  if (p.colorCabello.toString().isNotEmpty)
    listaWidget.add(
        Texto(atributo: 'color de cabello', valor: p.colorCabello.toString()));

  if (p.varita != null) {
    if (p.varita!['wood'].toString() != '') {
      String maderaV = p.varita!['wood'].toString();
      listaWidget.add(Texto(atributo: 'madera varita', valor: maderaV));
    }
    if (p.varita!['core'].toString() != '') {
      String nucleoV = p.varita!['core'].toString();
      listaWidget.add(Texto(atributo: 'nucleo varita', valor: nucleoV));
    }
    if (p.varita!['length'].toString() != 'null') {
      String largoV = p.varita!['length'].toString();
      listaWidget.add(Texto(atributo: 'largo varita', valor: largoV));
    }
  }
  if (p.patronus.toString().isNotEmpty)
    listaWidget.add(Texto(atributo: 'patronus', valor: p.patronus!.toString()));
  listaWidget.add(Texto(
      atributo: 'estudiante hogwarts', valor: p.estudianteHowarts!.toString()));
  listaWidget.add(
      Texto(atributo: 'staff hogwarts', valor: p.varitaHowarts!.toString()));
  if (p.actor.toString().isNotEmpty)
    listaWidget.add(Texto(atributo: 'actor', valor: p.actor!.toString()));
  if (p.actoresAlt != null) {
    if (p.actoresAlt!.isNotEmpty) {
      for (var i = 0; i < p.nombresAlt!.length; i++) {
        listaWidget.add(
            Texto(atributo: 'actor alternativo$i', valor: p.actoresAlt![i]));
      }
    }
  }
  listaWidget.add(Texto(atributo: 'vive', valor: p.vive.toString()));
  if (p.imagen!.isNotEmpty) {
    var widget = CachedNetworkImage(
      imageUrl: p.imagen!.toString(),
      placeholder: (context, url) => const CircularProgressIndicator(),
      errorWidget: (context, url, error) => const Icon(Icons.error),
    );
    listaWidget.add(widget);
  }
  listaWidget.add(const SizedBox(height: 30));

  listaWidget.add(Boton(
    texto: 'Regresar',
    evento: ClickRegresar(),
  ));
  return listaWidget;
}

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

class Texto extends StatelessWidget {
  final String atributo;
  final String valor;
  const Texto({super.key, required this.atributo, required this.valor});

  @override
  Widget build(BuildContext context) {
    return Expanded(child: Text('$atributo: $valor'));
  }
}

class Texto2 extends StatelessWidget {
  final String atributo;
  final Widget widget;
  const Texto2({super.key, required this.atributo, required this.widget});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Text('$atributo: '),
        ),
        Expanded(child: widget),
      ],
    );
  }
}

class Texto3 extends StatelessWidget {
  final String atributo;
  final String valor;
  const Texto3({super.key, required this.atributo, required this.valor});

  @override
  Widget build(BuildContext context) {
    return Text('$atributo: $valor');
  }
}
