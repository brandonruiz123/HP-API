import 'package:flutter/material.dart';

class VistaCreandose extends StatelessWidget {
  const VistaCreandose({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SizedBox(
        width: 200,
        height: 200,
        child: CircularProgressIndicator.adaptive(),
      ),
    );
  }
}
