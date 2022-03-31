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

  int _counter =0;
  List<Widget> _list = [];

  @override
  void initState() {
    super.initState();
    for(int i=0;i<5;i++){
      Widget child = _newItem(i);
      _list.add(child);
    }
  }


  void _onClicked(){
    Widget child = _newItem(_counter);
    setState(() => _list.add(child));
  }


  Widget  _newItem(int i){
    Key key=Key("item $i");
    Container child=Container(
      key: key,
      padding: EdgeInsets.all(10.0),
      child: Chip(
        label: Text("$i name here"),
        deleteIconColor: Colors.red,
        deleteButtonTooltipMessage: 'Delete',
        onDeleted: ()=> _removeItem(key),
        avatar: CircleAvatar(
          backgroundColor: Colors.grey.shade100,
          child: Text(i.toString()),
        ),
      ),
    );
    _counter++;
    return child;
  }



  void _removeItem(Key key){

    for(int i=0;i<_list.length;i++){
      Widget child = _list.elementAt(i);
      if(child.key == key){
        setState(() {
          _list.removeAt(i);
        });
      }
    }

  }

  @override
  Widget build(BuildContext context){

    return Scaffold(
      appBar: AppBar(
        title: const Text("First App"),
      ),
      floatingActionButton: FloatingActionButton(onPressed: _onClicked,child: Icon(Icons.add)),
      body: Container(
        padding: const EdgeInsets.all(32.0),
        child: Center(
          child: Column(
              children: _list
          ),
        ),

      ),
    );
  }

}


