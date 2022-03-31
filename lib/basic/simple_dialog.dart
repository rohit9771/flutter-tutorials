import 'package:flutter/material.dart';
import 'dart:async';

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

enum Answers{yes,no,mayBe}


class _State extends State<MyApp>{

  String _value= '';

  void _setValue(String value) => setState(() => _value = value );

  Future _askUser() async {

    switch(
    await showDialog(context: context, builder:(BuildContext buildContext) {
      return SimpleDialog(
        title: const Text("Do you like Flutter"),
        children: <Widget>[
          SimpleDialogOption(child:  Text("Yes!!"), onPressed: () { Navigator.pop(context,Answers.yes);},),
          SimpleDialogOption(child:  Text("No!!"), onPressed: () { Navigator.pop(context,Answers.no);},),
          SimpleDialogOption(child:  Text("MayBe!!"), onPressed: () { Navigator.pop(context,Answers.mayBe);},)
        ],
      );
    } )
    ) {
      case Answers.yes: _setValue('yes :)'); break;
      case Answers.no: _setValue('no :('); break;
      case Answers.mayBe: _setValue('mayBe :|'); break;
    }
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
              Text(_value),
              ElevatedButton(onPressed: _askUser, child: Text('Click Me'))
            ],
          ),
        ),

      ),
    );
  }

}


