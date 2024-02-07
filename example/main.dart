import 'package:flex_gap/flex_gap.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: SafeArea(
        child: Scaffold(
          body: Container(
            height: 600,
            width: double.infinity,
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black, strokeAlign: 1)),
            child: FlexGap(
              axis: Axis.vertical,
              crossAxisAlignment: CrossAxisAlignment.center,
              locatedSpace: const {3: 100},
              globalSpace: 50,
              startSpacerIndex: 4,
              children: [
                _listElements[1],
                _listElements[2],
                _listElements[3],
                _listElements[4],
                _listElements[5],
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class GapWidget extends StatelessWidget {
  final Color color;
  const GapWidget({super.key, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7),
          color: color.withOpacity(0.3),
          border: Border.all(color: color, strokeAlign: 1)),
    );
  }
}

List<Widget> _listElements = const [
  GapWidget(
    color: Colors.black,
  ),
  GapWidget(
    color: Colors.deepOrange,
  ),
  GapWidget(
    color: Colors.teal,
  ),
  GapWidget(
    color: Colors.amber,
  ),
  GapWidget(
    color: Colors.blue,
  ),
  GapWidget(
    color: Colors.blue,
  ),
  GapWidget(
    color: Colors.black,
  ),
  GapWidget(
    color: Colors.deepOrange,
  ),
  GapWidget(
    color: Colors.teal,
  ),
  GapWidget(
    color: Colors.amber,
  ),
  GapWidget(
    color: Colors.blue,
  ),
  GapWidget(
    color: Colors.blue,
  ),
  GapWidget(
    color: Colors.black,
  ),
  GapWidget(
    color: Colors.deepOrange,
  ),
  GapWidget(
    color: Colors.teal,
  ),
  GapWidget(
    color: Colors.amber,
  ),
  GapWidget(
    color: Colors.blue,
  ),
  GapWidget(
    color: Colors.blue,
  ),
  GapWidget(
    color: Colors.black,
  ),
  GapWidget(
    color: Colors.deepOrange,
  ),
  GapWidget(
    color: Colors.teal,
  ),
  GapWidget(
    color: Colors.amber,
  ),
  GapWidget(
    color: Colors.blue,
  ),
  GapWidget(
    color: Colors.blue,
  ),
  GapWidget(
    color: Colors.black,
  ),
  GapWidget(
    color: Colors.deepOrange,
  ),
  GapWidget(
    color: Colors.teal,
  ),
  GapWidget(
    color: Colors.amber,
  ),
  GapWidget(
    color: Colors.blue,
  ),
  GapWidget(
    color: Colors.blue,
  ),
  GapWidget(
    color: Colors.black,
  ),
  GapWidget(
    color: Colors.deepOrange,
  ),
  GapWidget(
    color: Colors.teal,
  ),
  GapWidget(
    color: Colors.amber,
  ),
  GapWidget(
    color: Colors.blue,
  ),
  GapWidget(
    color: Colors.blue,
  ),
  GapWidget(
    color: Colors.black,
  ),
  GapWidget(
    color: Colors.deepOrange,
  ),
  GapWidget(
    color: Colors.teal,
  ),
  GapWidget(
    color: Colors.amber,
  ),
  GapWidget(
    color: Colors.blue,
  ),
  GapWidget(
    color: Colors.blue,
  ),
  GapWidget(
    color: Colors.black,
  ),
  GapWidget(
    color: Colors.deepOrange,
  ),
  GapWidget(
    color: Colors.teal,
  ),
  GapWidget(
    color: Colors.amber,
  ),
  GapWidget(
    color: Colors.blue,
  ),
  GapWidget(
    color: Colors.blue,
  ),
  GapWidget(
    color: Colors.black,
  ),
  GapWidget(
    color: Colors.deepOrange,
  ),
  GapWidget(
    color: Colors.teal,
  ),
  GapWidget(
    color: Colors.amber,
  ),
  GapWidget(
    color: Colors.blue,
  ),
  GapWidget(
    color: Colors.blue,
  ),
  GapWidget(
    color: Colors.black,
  ),
  GapWidget(
    color: Colors.deepOrange,
  ),
  GapWidget(
    color: Colors.teal,
  ),
  GapWidget(
    color: Colors.amber,
  ),
  GapWidget(
    color: Colors.blue,
  ),
  GapWidget(
    color: Colors.blue,
  ),
  GapWidget(
    color: Colors.black,
  ),
  GapWidget(
    color: Colors.deepOrange,
  ),
  GapWidget(
    color: Colors.teal,
  ),
  GapWidget(
    color: Colors.amber,
  ),
  GapWidget(
    color: Colors.blue,
  ),
  GapWidget(
    color: Colors.blue,
  ),
];
