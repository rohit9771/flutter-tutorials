import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  _State createState() => _State();
}

enum Animals { Cat, Dog, Bird, Lizard, Fish }

class _State extends State<MyApp> {
  Animals _selected = Animals.Dog;
  String _value = "Make a selection";
  List<PopupMenuItem<Animals>> _items = [];

  @override
  // ignore: must_call_super
  void initState() {
    for (Animals animal in Animals.values) {
      _items.add(PopupMenuItem<Animals>(
        child: Text(_getDisplay(animal)),
        value: animal,
      ));
    }
  }

  void _onSelected(Animals animal) {
    setState(() {
      _selected = animal;
      _value = "You selected : ${_getDisplay(animal)}";
    });
  }

  String _getDisplay(Animals animal) {
    int _index = animal.toString().indexOf(".");
    _index++;
    return animal.toString().substring(_index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("First App"),
      ),
      body: Container(
        padding: const EdgeInsets.all(32.0),
        child: Center(
          child: Row(children: <Widget>[
            Container(
              padding: const EdgeInsets.all(5.0),
              child: Text(_value),
            ),
            PopupMenuButton<Animals>(
              child: const Icon(Icons.input),
              initialValue: Animals.Dog,
              onSelected: _onSelected,
              itemBuilder: (BuildContext context) {
                return _items;
              },
            )
          ]),
        ),
      ),
    );
  }
}
