import 'package:flutter/material.dart';


void main(){
  runApp(const MaterialApp(
      home : MyApp()
  ));

}

class MyApp extends StatefulWidget{
  const MyApp({Key? key}) : super(key: key);
  @override
  _State createState() => _State();

}

class _State extends State<MyApp>{

  String _value = "";

  void _onClick(String value) => setState(() => _value=value);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text("First App"),
      ),
      persistentFooterButtons: <Widget>[
        IconButton(onPressed: () => _onClick("Button1"), icon: Icon(Icons.timer)),
        IconButton(onPressed: () => _onClick("Button2"), icon: Icon(Icons.people)),
        IconButton(onPressed: () => _onClick("Button3"), icon: Icon(Icons.map)),
      ],
      body: Container(
        padding: const EdgeInsets.all(32.0),
        child: Center(
          child: Column(
            children: <Widget>[
              Text(_value)
            ],
          ),
        ),

      ),
    );
  }

}


