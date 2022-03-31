import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  _State createState() => _State();
}

class Area {
  int index;
  String name;
  Color color;

  Area({this.index= -1, this.name= "Area", this.color= Colors.blueGrey});
}

class _State extends State<MyApp> {
  int _location = 0;
  final List<Area> _areas = <Area>[];

  @override
  void initState() {
    for (int i = 0; i < 16; i++) {
      _areas.add(Area(index: i, name: "Area ${i}"));
    }

    var rng = Random();
    _location = rng.nextInt(_areas.length);
  }

  Widget _generate(int index) {
    return GridTile(
      child: Container(
        padding: const EdgeInsets.all(5.0),
        child: ElevatedButton(
          onPressed: () => _onPressed(index) ,
          style: ElevatedButton.styleFrom(
            primary: _areas[index].color
          ),
          child: Text(
            _areas[index].name,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }

  void _onPressed(int index) {
    setState(() {
      if (index == _location) {
        _areas[index].color = Colors.green;
      } else {
        _areas[index].color = Colors.red;
      }
    });
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
            child: GridView.count(
              crossAxisCount: 3,
              children: List<Widget>.generate(16, _generate),
            ),
          ),
        ));
  }
}
