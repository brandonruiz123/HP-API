import 'package:flutter/cupertino.dart';
import 'package:hp_api_application/caracteristicas/verificaciones/vistas/common_widgets.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../../dominio/personaje.dart';

Widget tieneImagen(Personaje p) {
  if (p.imagen != null) {
    return CachedNetworkImage(
      imageUrl: p.imagen!,
    );
  } else {
    return const Text('');
  }
}

class VistaMostrandoPersonaje extends StatelessWidget {
  final Personaje p;
  const VistaMostrandoPersonaje({Key? key, required this.p}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Template(
      texto: 'Personaje Encontrado',
      widget: Expanded(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: muestraDatos(p),
          // children: Expanded(child: ListView(children: muestraDatos(p).map().toList()),
        ),
      ),
    );
  }
}
