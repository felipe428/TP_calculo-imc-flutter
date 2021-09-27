import 'package:flutter/material.dart';

class Sobre extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sobre"),
        centerTitle: true,
      ),
      body: Container(
        color: Color(0xFF454545),
        padding: const EdgeInsets.all(3.0),
        alignment: Alignment.center,
        child:
            const Text("Versão 1.0 - Desenvolivda por Felipe Santos da Silva"),
      ),
    );
  }
}
