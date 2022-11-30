import 'package:flutter/material.dart';

class VistaMostrandoMenu extends StatelessWidget {
  const VistaMostrandoMenu ({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HP-API',
      home: Scaffold(
        appBar: AppBar(
          title: const Center(child: Text('Menu'),),
        ),
        body:const Center(child: Botones(),),
      ),
    );
  }
}


class Botones extends StatelessWidget {
  const Botones({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [  Boton(texto: 'Boton1'),
        Boton(texto: 'Boton2'),
        Boton(texto: 'Boton3')
        ],
      ),
    );
  }
}


class Boton extends StatelessWidget {
  final String? texto;
  const Boton({super.key, this.texto});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      
      height: 25,
      width: 100,
      child: Padding(
        padding: const EdgeInsets.all(2),
        child: TextButton(
  style: ButtonStyle(
        foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
        backgroundColor: MaterialStateProperty.all<Color>(Colors.blue)
  ),
  onPressed: () { },
  child: Center(child:Text('$texto')),
),
      ),
    );
  }
}




