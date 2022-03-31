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

  bool _value1 = false;
  bool _value2 = false;

  void _value1Changed(bool? value) => setState(() => _value1=value! );
  void _value2Changed(bool? value) => setState(() => _value2=value! );


  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text("Name Here"),
      ),
      body: Container(
        padding: const EdgeInsets.all(32.0),
        child: Center(
          child: Column(
            children:  <Widget>[
              Checkbox(value: _value1, onChanged: _value1Changed,autofocus: true),
              CheckboxListTile(value: _value2, onChanged: _value2Changed, title: Text('Hello'),
                controlAffinity: ListTileControlAffinity.leading, subtitle: Text("subtitle"), secondary: Icon(Icons.download), activeColor: Colors.indigo, )
            ],
          ),
        ),

      ),
    );
  }

}


