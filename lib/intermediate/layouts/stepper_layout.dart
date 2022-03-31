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

class _State extends State<MyApp> {

  List<Step> _steps = [];
  int _current = 0;


  @override
  void initState() {
    _current = 0;
    _steps = <Step>[
      const Step(title: Text('Step 1'), content: Text('Do Something'),),
      const Step(title: Text('Step 2'), content: Text('Do Something'),),
      const Step(title: Text('Step 3'), content: Text('Do Something'),),
    ];
  }

  void _stepContinue() {
    setState(() {
      _current++;
      if(_current >= _steps.length) _current = _steps.length - 1;
    });
  }

  void _stepCancel() {
    setState(() {
      _current--;
      if(_current < 0) _current = 0;
    });
  }

  void _stepTap(int index) {
    setState(() {
      _current = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Name here'),
      ),
      body: Container(
          padding: const EdgeInsets.all(32.0),
          child: Center(
              child: Stepper(
                steps: _steps,
                type: StepperType.vertical,
                currentStep: _current,
                onStepCancel: _stepCancel,
                onStepContinue: _stepContinue,
                onStepTapped: _stepTap,
              )
          )
      ),
    );
  }
}
