import 'dart:convert';
import 'package:http/http.dart' as http;

class ElementoModel {
  String simbolo;
  String nombre;
  double masa;
  String imagen;

  ElementoModel({
    required this.simbolo,
    required this.nombre,
    required this.masa,
    required this.imagen,
  });

  factory ElementoModel.fromMap(Map<String, dynamic> json) {
    return ElementoModel(
      simbolo: json['simbolo'],
      nombre: json['nombre'],
      masa: json['masa'],
      imagen: json['imagen'],
    );
  }
}

List<ElementoModel> decodelemento(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
  return parsed
      .map<ElementoModel>((json) => ElementoModel.fromMap(json))
      .toList();
}

Future<List<ElementoModel>> fetchElemento() async {
  var response = await http.get(Uri.parse(
      "https://script.google.com/macros/s/AKfycbwpyAL-7oIjijMx30hYmwsYVJfmHAaNkst7HwkndJsxSHbuPMFqgYjvNvBCbu3FeBoI/exec"));
  if (response.statusCode == 200) {
    return decodelemento(response.body);
  } else {
    throw Exception('Unable to fetch data from the REST API');
  }
}
