import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  _State createState() => _State();
}

class _State extends State<MyApp> {
  TextEditingController _user = TextEditingController();
  TextEditingController _pass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("First App"),
      ),
      body: Container(
        padding: const EdgeInsets.all(32.0),
        child: Center(
          child: Column(
            children: <Widget>[
              Text("Login Here"),
              Row(
                children: <Widget>[
                  Text("username : "),
                  Expanded(
                      child: TextField(
                        controller: _user,
                      ))
                ],
              ),
              Row(
                children: <Widget>[
                  Text("password : "),
                  Expanded(
                      child: TextField(
                        controller: _pass,
                        obscureText: true,
                      ))
                ],
              ),

              Padding(
                padding: EdgeInsets.all(12.0),
                child: ElevatedButton(
                    child: Text("Click Me"),
                    onPressed: () => print(_user.text)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
