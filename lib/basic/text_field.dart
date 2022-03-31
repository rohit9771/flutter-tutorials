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

  void _onChange(String value){
    setState(() {
      _value= "Change ${value}";
    });
  }

  void _onSubmit(String value){
    setState(() {
      _value= "Submit ${value}";
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
              Text(_value),
              TextField(
                decoration: const InputDecoration(
                    labelText: "Hello",
                    hintText: "Hello",
                    icon: Icon(Icons.people)
                ),
                autocorrect: true,
                autofocus: true,
                keyboardType: TextInputType.text,
                onChanged: _onChange,
                onSubmitted: _onSubmit,
              )
              // TextButton(onPressed: () => _onPressed("Clicked by Anil"), child: const Text("Click Me"))
              // IconButton(onPressed: () => add(), icon: const Icon(Icons.add)),
              // IconButton(onPressed: () => subtract(), icon: const Icon(Icons.remove))
            ],
          ),
        ),

      ),
    );
  }

}


