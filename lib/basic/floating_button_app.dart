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
  void _onClicked() => setState(() => _value = DateTime.now().toString());


  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text("First App"),
      ),

      floatingActionButton: FloatingActionButton(onPressed: _onClicked,backgroundColor: Colors.red,mini: false,child: const Icon(Icons.timer),),
      body: Container(
        padding: const EdgeInsets.all(32.0),
        child: Center(
          child: Column(
            children:  <Widget>[
              Text(_value)
            ],
          ),
        ),

      ),
    );
  }

}


