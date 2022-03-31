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


  void _showButton(){
    showModalBottomSheet<void>(context: context, builder: (BuildContext context){
      return Container( padding: const EdgeInsets.all(15.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            const Text("Some Info Here"),
            ElevatedButton(onPressed: () => Navigator.pop(context), child: const Text("Close"))
          ],
        ),);
    });
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text("First App"),
      ),
      body: Container(
        padding: const EdgeInsets.all(32.0),
        child: Center(
          child: Column(
            children: <Widget>[
              const Text("Add Widgets Here"),
              ElevatedButton(onPressed: _showButton, child: const Text("Click Me"))
            ],
          ),
        ),

      ),
    );
  }

}


