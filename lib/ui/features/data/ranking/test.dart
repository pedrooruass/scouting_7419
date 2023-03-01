import 'package:flutter/material.dart';

class Test extends StatefulWidget {
  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
  double _value = 0;

  void _updateProgress() {
    // simulate updates to the progress value
    for (double i = 0; i <= 1; i += 0.01) {
      _value = i;
      Future.delayed(Duration(milliseconds: 50), () {
        setState(() {});
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        LinearProgressIndicator(
          value: _value,
        ),
        SizedBox(height: 10),
        Text("${(_value * 100).round()}%"),
        ElevatedButton(onPressed: _updateProgress, child: Text('Start Progress')),
      ],
    );
  }
}
