import 'package:flutter/material.dart';

import 'package:flutter/cupertino.dart';
import 'package:prototipo_dieta/datos.dart';
import 'package:prototipo_dieta/settings_page.dart';
import 'package:prototipo_dieta/vertical_space.dart';

import 'deails_page.dart';
import 'diet_item_widget.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int? _indexGenero = 0;
  int? _indexEdad = 0;

  int? indiceVegetalesVerdes = null;

  List<DietItem> dietItemsList = [];
  // This dirty trick is used to be able to pass ints by reference to the callback
  List<List<int?>> foodIndex = List.generate(Items.values.length, (_) => [null]);

  @override
  initState() {
    debugPrint("En initState");
  }

  List<int?> indice = List.filled(15, null);

  final GlobalKey<_MyAppState> _navBarKey = GlobalKey<_MyAppState>();

  void foodCallback(List<int?> index, int? selection) {
    debugPrint("index: $index, selection: $selection");
    setState(() {
      index[0] = selection;
    });
    debugPrint("index: $index, selection: $selection");
  }

  List<DietItem> dietItems() {
    for (var i = 0; i < Items.values.length; i++) {
      dietItemsList.add(DietItem(callback: foodCallback, index: foodIndex[i], title: titulo[i], opciones: opciones[_indexGenero!][_indexEdad!][i]));
    }
    return dietItemsList;
  }

  String calcularScore(List<List<int?>> selections) {
    int score = 0;
    // Recorro la lista. Si están todos los datos devuelvo el score y, si no, Ingresar datos
    for (int i = 0; i < Items.values.length; i++) {
      if (selections[i][0] != null) {
        score += selections[i][0]!;
      } else {
        return "Ingresar datos";
      }
    }
    return score.toString();
  }

  @override
  Widget build(BuildContext context) {
    debugPrint("En build");
    debugPrint(foodIndex.toString());
    dietItemsList.clear();
    // En main
    return CupertinoApp(
      home: CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          key: _navBarKey,
          backgroundColor: Colors.blue[200],
          leading: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Prototipo de Dieta App',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ],
          ),
          trailing: GestureDetector(
            child: Icon(CupertinoIcons.bars),
            onTap: () {
              showCupertinoModalPopup(
                context: _navBarKey.currentContext!,
                builder: (BuildContext context) => CupertinoActionSheet(
                  title: Text('Menu'),
                  actions: [
                    CupertinoActionSheetAction(
                      child: Text('Algo de info'),
                      onPressed: () {
                        Navigator.push(
                          context,
                          CupertinoPageRoute(
                            builder: (context) => DetailsPage(
                              context: _navBarKey.currentContext!,
                            ),
                          ),
                        );
                      },
                    ),
                    CupertinoActionSheetAction(
                      child: Text('Otra info'),
                      onPressed: () {
                        Navigator.push(
                          context,
                          CupertinoPageRoute(
                            builder: (context) => SettingsPage(
                              context: _navBarKey.currentContext!,
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                  cancelButton: CupertinoActionSheetAction(
                    child: Text('Cancelar'),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              );
            },
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.0),
                    color: Colors.yellow[200],
                  ),
                  width: double.infinity,
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
                      Row(
                        children: [
                          // SizedBox(width: 60.0),
                          Expanded(
                            child: Center(
                              child: Text(
                                "Score: ${calcularScore(foodIndex)}",
                                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                              ),
                            ),
                          ),
                          CupertinoButton(
                            child: Icon(Icons.delete),
                            onPressed: () {
                              setState(() {
                                foodIndex.forEach((element) => element[0] = null);
                              });
                            },
                          ),
                        ],
                      ),
                      VerticalSpace(altura: 10.0),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  color: Colors.yellow[50],
                  child: ListView(
                    children: [
                      ...dietItems(),
                      VerticalSpace(altura: 15.0),
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
