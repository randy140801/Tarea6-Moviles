import 'package:flutter/material.dart';
import 'package:tarea6/elemento.dart';
import 'package:tarea6/home.dart';

void main() {
  runApp(MyApp());
}

ElementoModel monumentModel =
    ElementoModel(imagen: '', nombre: '', simbolo: '', masa: 0);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(elemento: fetchElemento()),
    );
  }
}
