import 'package:flutter/material.dart';
import 'dart:async';

void main() {
  runApp(new MaterialApp(
    home: new MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<MyApp> {

  Future  _showAlert(BuildContext context, String msg) async {
    return showDialog(
        context: context,
        builder: (BuildContext buildContext) {
          return AlertDialog(
            title: Text(msg),
            actions: <Widget>[
              TextButton(
                onPressed: ()=> Navigator.pop(context),
                child: const Text('OK'),
              )
            ],
          );
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar:  AppBar(
        title:  Text('Name here'),
      ),
      body:  Container(
          padding:  const EdgeInsets.all(32.0),
          child:  Center(
            child:  Column(
              children: <Widget>[
                const Text('Add Widgets Here'),
                ElevatedButton(onPressed: () => _showAlert(context, 'Do you like flutter, I do!'), child:  const Text('Click me'),)
              ],
            ),
          )
      ),
    );
  }
}
