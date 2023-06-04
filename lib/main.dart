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
  int _index = 0;
  int _index2 = 0;
  int _index3 = 0;
  int? _indexExterno = null;
  int? indiceVegetalesVerdes = null;

  List<DietItem> dietItemsList = [];

  @override
  initState() {
    debugPrint("En initState");
 //   dietItems();
  }

  List<int?> indice = List.filled(15, null);

  final GlobalKey<_MyAppState> _navBarKey = GlobalKey<_MyAppState>();

  List<DietItem> dietItems() {
    for (var i = 0; i < Items.values.length; i++) {
      dietItemsList
          .add(DietItem(callback: (item) => debugPrint("Callback invocado"), title: titulo[i], opciones: opciones[_indexGenero!][_indexEdad!][i]));
    }
    return dietItemsList;
  }

  @override
  Widget build(BuildContext context) {
    debugPrint("En build");
    dietItemsList.clear();
    // En main
    return CupertinoApp(
      home: CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          key: _navBarKey,
          leading: Text(
            'Prototipo de Dieta App',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
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
                      child: Text('Details'),
                      onPressed: () {
                        Navigator.push(
                          context,
                          CupertinoPageRoute(
                              builder: (context) => DetailsPage(
                                    context: _navBarKey.currentContext!,
                                  )),
                        );
                      },
                    ),
                    CupertinoActionSheetAction(
                      child: Text('Settings'),
                      onPressed: () {
                        Navigator.push(
                          context,
                          CupertinoPageRoute(
                              builder: (context) => SettingsPage(
                                    context: _navBarKey.currentContext!,
                                  )),
                        );
                      },
                    ),
                  ],
                  cancelButton: CupertinoActionSheetAction(
                    child: Text('Cancel'),
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
                      ...dietItems(),
                      VerticalSpace(altura: 15.0),
 /*                     *//*****************************    Vegetales Verdes *****************************//*
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
                        opciones: opciones[Genero.femenino.index][Edad.cinco_ocho.index][Items.vegetales_verdes.index],
                      ),
                      VerticalSpace(altura: 10),
                      *//*****************************    Vegetales Verdes *****************************//*
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
                        opciones: opciones[Genero.femenino.index][Edad.cinco_ocho.index][Items.vegetales_rojos.index],
                      ),
                      VerticalSpace(altura: 10),
                      *//*****************************    Legumbres  *****************************//*
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
                        opciones: opciones[Genero.femenino.index][Edad.cinco_ocho.index][Items.legumbres.index],
                      ),
                      VerticalSpace(altura: 10),
     */                 /*****************************    Legumbres  *****************************/
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
