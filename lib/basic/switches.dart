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

  void _onChanged1(bool? value) => setState(() =>   _value1=value! );
  void _onChanged2(bool? value) => setState(() =>   _value2=value! );



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
            children:  <Widget>[
              Switch(value: _value1, onChanged: _onChanged1),
              SwitchListTile(value: _value2, onChanged: _onChanged2,
                title: const Text("Hello",style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold)),
                subtitle: const Text("SubTitle"),)
            ],
          ),
        ),

      ),
    );
  }

}


