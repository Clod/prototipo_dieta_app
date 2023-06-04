import 'package:flutter/cupertino.dart';

class DietItem extends StatelessWidget {
  final Function(int) callback;
  int? index;
  String title;
  List<String> opciones;

  DietItem({Key? key, required this.callback, this.index, required this.title, required this.opciones}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(child: Text(title), padding: EdgeInsets.all(8.0)),
          CupertinoSegmentedControl<int>(
            children: {
              0: Padding(child: Text(opciones[0]), padding: EdgeInsets.all(8.0)),
              1: Padding(child: Text(opciones[1]), padding: EdgeInsets.all(8.0)),
              2: Padding(child: Text(opciones[2]), padding: EdgeInsets.all(8.0)),
            },
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
            onValueChanged: callback,
            groupValue: index,
          ),
          //DietItem(),
        ],
      ),
    );
  }
}
