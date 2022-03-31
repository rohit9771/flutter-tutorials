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

  int _value = 0;

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text("First App"),
        backgroundColor: Colors.red,
        actions: <Widget>[
          IconButton(onPressed: () => setState(() => _value++), icon: const Icon(Icons.add)),
          IconButton(onPressed: () => setState(() => _value--), icon: const Icon(Icons.remove))
        ],
      ),
      body: Container(
        padding:  EdgeInsets.all(32.0),
        child: Center(
          child: Column(
            children:  <Widget>[
              Text(_value.toString())
            ],
          ),
        ),

      ),
    );
  }

}


