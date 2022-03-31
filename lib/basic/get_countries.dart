import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';
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

class _State extends State<MyApp>{

  Map _countries = {};

  void _getData() async {
    var url = "http://country.io/names.json";
    var response = await http.get(url);

    if(response.statusCode == 200){
      setState(() {
        _countries = jsonDecode(response.body);
        print('Loaded ${_countries.length} countries');
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getData();
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
              Text("Countries", style: TextStyle(fontWeight: FontWeight.bold)),
              Expanded(child: ListView.builder(
                itemCount: _countries.length,
                itemBuilder: (BuildContext context, int index){
                  String key = _countries.keys.elementAt(index);
                  return Row(
                    children: <Widget>[
                      Text("${key}"),
                      Text(_countries[key])

                    ],
                  );
                }
                ,))
            ],
          ),
        ),

      ),
    );
  }

}


