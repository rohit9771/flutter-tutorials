import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _State createState() => _State();
}

class Choice {
  final String? title;
  final IconData? icon;

  const Choice({this.title, this.icon});
}

class _State extends State<MyApp> with SingleTickerProviderStateMixin {

  TabController? _controller;
  final List<Choice> _items = const <Choice>[
    Choice(title: 'CAR', icon: Icons.directions_car),
    Choice(title: 'BICYCLE', icon: Icons.directions_bike),
    Choice(title: 'BOAT', icon: Icons.directions_boat),
    Choice(title: 'BUS', icon: Icons.directions_bus),
    Choice(title: 'TRAIN', icon: Icons.directions_railway),
    Choice(title: 'WALK', icon: Icons.directions_walk),
  ];


  @override
  void initState() {
    _controller = TabController(length: _items.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Name here'),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(48.0),
            child: Theme(
                data: Theme.of(context).copyWith(colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.white)),
                child: Container(
                  height: 48.0,
                  alignment: Alignment.center,
                  child: TabPageSelector(controller: _controller,),
                )
            ),
          ),
        ),
        body: TabBarView(
          controller: _controller,
          children: _items.map((Choice item){
            return Container(
              padding: EdgeInsets.all(25.0),
              child: Center(
                child: Column(
                  children: <Widget>[
                    Text(item.title!),
                    Icon(item.icon, size: 120.0,)
                  ],
                ),
              ),

            );
          }).toList(),
        )
    );
  }
}
