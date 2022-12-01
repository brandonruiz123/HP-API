import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../dominio/personaje.dart';
import '../bloc.dart';

List<Widget> muestraDatos(Personaje p) {
  List<Widget> listaWidget = [];
  listaWidget.add(Expanded(child: Texto(atributo: 'nombre', valor: p.nombre)));
  if (p.nombresAlt != null) {
    if (p.nombresAlt!.isNotEmpty) {
      for (var i = 0; i < p.nombresAlt!.length; i++) {
        listaWidget.add(Texto(
            atributo: 'nombre alterno ${i + 1}', valor: p.nombresAlt![i]));
      }
    }
  }
  listaWidget.add(Expanded(
      child: Texto(atributo: 'especie ', valor: p.especie.toString())));
  listaWidget.add(
      Expanded(child: Texto(atributo: 'genero ', valor: p.genero.toString())));
  listaWidget.add(Expanded(
      child: Texto(atributo: 'escuela ', valor: p.escuela.toString())));
  listaWidget.add(Expanded(
      child: Texto(
          atributo: 'fecha de nacimiento ', valor: p.fechaNac.toString())));
  listaWidget.add(Expanded(
      child:
          Texto(atributo: 'año de nacimiento ', valor: p.anioNac.toString())));
  listaWidget.add(
      Expanded(child: Texto(atributo: 'es mago ', valor: p.mago.toString())));
  listaWidget.add(Expanded(
      child: Texto(atributo: 'ancestro ', valor: p.ancestro.toString())));
  listaWidget.add(Expanded(
      child: Texto(atributo: 'color de ojos ', valor: p.colorOjos.toString())));
  listaWidget.add(Expanded(
      child: Texto(
          atributo: 'color de cabello ', valor: p.colorCabello.toString())));

  if (p.varita != null) {
    if (p.varita!['wood'].toString() != '') {
      String maderaV = p.varita!['wood'].toString();
      listaWidget.add(
          Expanded(child: Texto(atributo: 'madera varita ', valor: maderaV)));
    }
    if (p.varita!['core'].toString() != '') {
      String nucleoV = p.varita!['core'].toString();
      listaWidget.add(
          Expanded(child: Texto(atributo: 'nucleo varita ', valor: nucleoV)));
    }
    if (p.varita!['length'].toString() != '') {
      String largoV = p.varita!['length'].toString();
      listaWidget.add(
          Expanded(child: Texto(atributo: 'largo varita ', valor: largoV)));
    }
  }
  listaWidget.add(Expanded(
      child: Texto(atributo: 'patronus ', valor: p.patronus!.toString())));
  listaWidget.add(Expanded(
    child: Texto(
        atributo: 'estudiante hogwarts ',
        valor: p.estudianteHowarts!.toString()),
  ));
  listaWidget.add(Expanded(
      child: Texto(
          atributo: 'staff hogwarts ', valor: p.varitaHowarts!.toString())));
  listaWidget.add(
      Expanded(child: Texto(atributo: 'actor ', valor: p.actor!.toString())));
  if (p.actoresAlt != null) {
    if (p.actoresAlt!.isNotEmpty) {
      for (var i = 0; i < p.nombresAlt!.length; i++) {
        listaWidget.add(Expanded(
            child: Texto(
                atributo: 'actor alternativo $i ', valor: p.actoresAlt![i])));
      }
    }
  }
  listaWidget
      .add(Expanded(child: Texto(atributo: 'vive ', valor: p.vive.toString())));
  listaWidget.add(const Expanded(child: SizedBox(height: 30)));
  // if (p.imagen != '') {
  //   // var widget = CachedNetworkImage(
  //   //   imageUrl: p.imagen!,
  //   //   placeholder: (context, url) => const CircularProgressIndicator(),
  //   //   errorWidget: (context, url, error) => const Icon(Icons.error),
  //   // );
  //   // listaWidget.add(Boton4(atributo: 'imagen: ', widget: widget));
  //   print(p.imagen.toString());
  // }
  listaWidget.add(Boton(
    texto: 'Regresar',
    evento: ClickRegresar(),
  ));
  // listaWidget.add(SizedBox())
  if (p.imagen == null) {}
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

class Botonn extends StatelessWidget {
  final String? texto;
  final Evento evento;
  const Botonn({super.key, this.texto, required this.evento});

  @override
  Widget build(BuildContext context) {
    final blocVerificacion = context.read<BlocVerificacion>();
    return Flexible(
      child: TextButton(
        style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
            backgroundColor: MaterialStateProperty.all<Color>(Colors.blue)),
        onPressed: () {
          blocVerificacion.add(evento);
        },
        child:
            Center(child: Text(style: const TextStyle(fontSize: 30), '$texto')),
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

class B extends StatelessWidget {
  final String atributo;
  final String valor;
  const B({super.key, required this.atributo, required this.valor});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: TextButton(
        style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all<Color>(Colors.black)),
        // backgroundColor: MaterialStateProperty.all<Color>(Colors.blue)),
        onPressed: () {},
        child: Center(
            child: Row(
          children: [
            Text(
                style:
                    const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                atributo),
            Text(
                style: const TextStyle(
                  fontSize: 15,
                ),
                valor),
          ],
        )),
      ),
    );
  }
}

class Boton4 extends StatelessWidget {
  final String atributo;
  final Widget widget;
  const Boton4({super.key, required this.atributo, required this.widget});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 800,
      child: Padding(
        padding: const EdgeInsets.all(2),
        child: TextButton(
          style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all<Color>(Colors.black)),
          // backgroundColor: MaterialStateProperty.all<Color>(Colors.blue)),
          onPressed: () {},
          child: Center(
              child: Row(
            children: [
              Text(
                  style: const TextStyle(
                      fontSize: 15, fontWeight: FontWeight.bold),
                  atributo),
              widget,
            ],
          )),
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
