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
  final List<Sales> _laptops = [];
  final List<Sales> _desktops = [];
  final List<charts.Series<Sales, String>> _chartData = [];

  void _makeData() {
    final rnd = Random();

    for (int i = 2016; i < 2019; i++) {
      _laptops.add(Sales(i.toString(), rnd.nextInt(1000)));
      _desktops.add(Sales(i.toString(), rnd.nextInt(1000)));
    }

    _chartData.add(charts.Series(
        id: "Sales",
        data: _laptops,
        domainFn: (Sales sales, _) => sales.year,
        measureFn: (Sales sales, _) => sales.sales,
        displayName: 'Sales',
        colorFn: (_, __) => charts.MaterialPalette.red.shadeDefault));

    _chartData.add(charts.Series(
        id: "Sales",
        data: _desktops,
        domainFn: (Sales sales, _) => sales.year,
        measureFn: (Sales sales, _) => sales.sales,
        displayName: 'Sales',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault));
  }

  @override
  void initState() {
    super.initState();
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
              const Text("Sales Data"),
              Expanded(
                  child: charts.BarChart(
                    _chartData,
                    vertical: true,
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
