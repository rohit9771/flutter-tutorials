import 'package:flutter/material.dart';
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
  int year;
  int sales;
  charts.Color color;

  Sales(
    this.year,
    this.sales,
    this.color,
  );
}

class _State extends State<MyApp> {
  List<Sales> _data = [];
  List<charts.Series<Sales, int>> _chartdata = [];

  void makeData() {
    _data = <Sales>[
      Sales(0, 100, charts.MaterialPalette.red.shadeDefault),
      Sales(1, 75, charts.MaterialPalette.blue.shadeDefault),
      Sales(2, 25, charts.MaterialPalette.green.shadeDefault),
      Sales(3, 5, charts.MaterialPalette.yellow.shadeDefault)
    ];

    _chartdata.add(charts.Series(
      id: "Sales",
      data: _data,
      colorFn: (Sales s, _) => s.color,
      domainFn: (Sales s, _) => s.year,
      measureFn: (Sales s, _) => s.sales,
    ));
  }

  @override
  void initState() {
    super.initState();
    makeData();
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
                  child: charts.PieChart(_chartdata,
                      animate: true,
                      animationDuration: const Duration(seconds: 5))),
            ],
          ),
        ),
      ),
    );
  }
}
