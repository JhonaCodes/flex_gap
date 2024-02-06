import 'package:flex_gap/flex_gap.dart';
import 'package:flex_gap/ui/flex_gap_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main(){

  testWidgets('flex_gap layout and spacing', (WidgetTester tester) async {
    await tester.pumpWidget( const MaterialApp(
      home: Scaffold(
        body: SizedBox(
          height: 300,
          child: FlexGap(
            axis: Axis.vertical,
            isScrollable: false,
            globalSpace: 8.0,
            children: [
              Text('Widget 1'),
              Text('Widget 2'),
              Text('Widget 3'),
            ],
          ),
        ),
      ),
    ));

    expect(find.text('Widget 1'), findsOneWidget);
    expect(find.text('Widget 2'), findsOneWidget);
    expect(find.text('Widget 3'), findsOneWidget);
  });

}