import 'package:flutter/material.dart';
import 'package:tarea6/elemento.dart';

Widget ElementoList(List<ElementoModel> Elemento) {
  return GridView.builder(
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
      itemCount: Elemento.length,
      itemBuilder: (context, index) {
        return Expanded(
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 18),
            child: Row(
              children: <Widget>[
                Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    ),
                    image: DecorationImage(
                      image: NetworkImage(Elemento[index].imagen),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      Elemento[index].simbolo,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 30),
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      });
}

class Home extends StatelessWidget {
  final Future<List<ElementoModel>> elemento;

  Home({Key? key, required this.elemento}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Tabla periodica'),
        ),
        body: Center(
          child: FutureBuilder<List<ElementoModel>>(
            future: elemento,
            builder: (context, snapshot) {
              if (snapshot.hasError) print(snapshot.error);
              return snapshot.hasData
                  ? ElementoList(snapshot.data!)
                  : Center(child: CircularProgressIndicator());
            },
          ),
        ));
  }
}
