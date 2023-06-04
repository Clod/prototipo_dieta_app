import 'package:flutter/material.dart';

import 'package:flutter/cupertino.dart';
import 'package:prototipo_dieta/datos.dart';
import 'package:prototipo_dieta/vertical_space.dart';

import 'diet_item_widget.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int? _indexGenero = null;
  int? _indexEdad = null;
  int _index = 0;
  int _index2 = 0;
  int _index3 = 0;
  int? _indexExterno = null;
  int? indiceVegetalesVerdes = null;

  List<int?> indice = List.filled(15, null);

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      home: CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: Text(
            'Prototipo de Dieta App',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                color: Colors.yellow,
                child: Column(
                  children: [
                    VerticalSpace(altura: 15.0),
                    Text(
                      "Género",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    VerticalSpace(altura: 10.0),
                    CupertinoSegmentedControl<int>(
                      children: {
                        0: Padding(child: Text('Niñas'), padding: EdgeInsets.all(8.0)),
                        1: Padding(child: Text('Niños'), padding: EdgeInsets.all(8.0)),
                      },
                      onValueChanged: (int? value) {
                        setState(() {
                          _indexGenero = value!;
                        });
                      },
                      groupValue: _indexGenero,
                    ),
                    VerticalSpace(altura: 15.0),
                    Text(
                      "Rango etario",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    VerticalSpace(altura: 10.0),
                    CupertinoSegmentedControl<int>(
                      children: {
                        0: Padding(child: Text('5 a 8 años'), padding: EdgeInsets.all(8.0)),
                        1: Padding(child: Text('9 a 13 años'), padding: EdgeInsets.all(8.0)),
                        2: Padding(child: Text('14 a 18 años'), padding: EdgeInsets.all(8.0)),
                      },
                      onValueChanged: (int? value) {
                        setState(() {
                          _indexEdad = value!;
                        });
                      },
                      groupValue: _indexEdad,
                    ),
                    VerticalSpace(altura: 15.0),
                    Text(
                      "Score: ",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    VerticalSpace(altura: 15.0),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  color: Color.fromRGBO(255, 255, 204, 1.0),
                  child: ListView(
                    children: [
                      VerticalSpace(altura: 15.0),
                      /*****************************    Vegetales Verdes *****************************/
                      DietItem(
                        callback: (uno) {
                          setState(() {
                            indice[Items.vegetales_verdes.index] = uno;
                          });
                          debugPrint(uno.toString());
                          return;
                        },
                        index: indice[Items.vegetales_verdes.index],
                        title: titulo[Items.vegetales_verdes.index],
                        opciones:opciones[Genero.femenino.index][Edad.cinco_ocho.index][Items.vegetales_verdes.index],
                      ),
                      VerticalSpace(altura: 10),
                      /*****************************    Vegetales Verdes *****************************/
                      DietItem(
                        callback: (uno) {
                          setState(() {
                            indice[Items.vegetales_rojos.index] = uno;
                          });
                          debugPrint(uno.toString());
                          return;
                        },
                        index: indice[Items.vegetales_rojos.index],
                        title: titulo[Items.vegetales_rojos.index],
                        opciones:opciones[Genero.femenino.index][Edad.cinco_ocho.index][Items.vegetales_rojos.index],
                      ),
                      VerticalSpace(altura: 10),
                      /*****************************    Legumbres  *****************************/
                      DietItem(
                        callback: (uno) {
                          setState(() {
                            indice[Items.legumbres.index] = uno;
                          });
                          debugPrint(uno.toString());
                          return;
                        },
                        index: indice[Items.legumbres.index],
                        title: titulo[Items.legumbres.index],
                        opciones:opciones[Genero.femenino.index][Edad.cinco_ocho.index][Items.legumbres.index],
                      ),
                      VerticalSpace(altura: 10),
                      /*****************************    Legumbres  *****************************/
                      DietItem(
                        callback: (uno) {
                          setState(() {
                            _indexEdad = uno;
                          });
                          debugPrint(uno.toString());
                          return;
                        },
                        index: _indexEdad,
                        title: "Pastas y masas integrales: masa: pizza, tarta, empanada, canelon, masa de taco.",
                        opciones: [
                          "1/4 plato diario o 1 porción de masa diario",
                          "1/2 plato diario o 2 porciones de masa diario",
                          "> 1/2 plato diario o > 2 porciones de masa diario",
                        ],
                      ),
                      DietItem(
                        callback: (uno) {
                          setState(() {
                            _indexExterno = uno;
                          });
                          debugPrint(uno.toString());
                          return;
                        },
                        index: _indexExterno,
                        title: "Pastas y masas integrales: masa: pizza, tarta, empanada, canelon, masa de taco.",
                        opciones: [
                          "1/4 plato diario o 1 porción de masa diario",
                          "1/2 plato diario o 2 porciones de masa diario",
                          "> 1/2 plato diario o > 2 porciones de masa diario",
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
