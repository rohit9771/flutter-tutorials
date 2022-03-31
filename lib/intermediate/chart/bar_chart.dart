import 'package:flutter/material.dart';
import 'dart:math';
import 'package:charts_flutter/flutter.dart' as charts;

void main() {
  runApp(const MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  _State createState() => _State();
}

class Sales {
  String year;
  int sales;
  Sales(this.year, this.sales);
}

class _State extends State<MyApp> {
  final List<Sales> _data = <Sales>[];
  final List<charts.Series<Sales, String>> _chartdata =
      <charts.Series<Sales, String>>[];

  void _makeData() {
    final rnd = Random();
    for (int i = 2010; i <= 2019; i++) {
      _data.add(Sales(i.toString(), rnd.nextInt(1000)));
    }

  _chartdata.add(charts.Series(
    id: 'Sales',
    colorFn: (_,__) => charts.MaterialPalette.cyan.shadeDefault,
    data: _data,
    domainFn: (Sales sales, _)=> sales.year,
    measureFn: (Sales sales, _)=> sales.sales,
    fillPatternFn: (_,__) => charts.FillPatternType.forwardHatch,
    displayName: 'Sales'

  ));

  }

  @override
  void initState() {
    _makeData();
  }

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
              Text("Sales Data"),
              Expanded(child: charts.BarChart(_chartdata))
              ],
          ),
        ),
      ),
    );
  }
}
