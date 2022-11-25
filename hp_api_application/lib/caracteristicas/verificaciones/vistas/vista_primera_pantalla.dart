import 'package:flutter/material.dart';

class VistaPrimeraPantalla extends StatelessWidget {
  const VistaPrimeraPantalla({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text("Escribe algo"),
        const TextField(),
        TextButton(onPressed: () {}, child: const Text("algo"))
      ],
    );
  }
}
