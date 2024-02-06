import 'package:flex_gap/flex_gap.dart';
import 'package:flex_gap/ui/flex_gap_widget.dart';
import 'package:flex_gap/ui/widget/scroll_gap.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('ScrollGap and flex_gap integration',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: Scaffold(
        body: ScrollGap(
          child: FlexGap(
            isScrollable: true,
            axis: Axis.vertical,
            children: [
              Text('Widget 1'),
              Text('Widget 2'),
              Text('Widget 3'),
            ],
          ),
        ),
      ),
    ));

    await tester.drag(find.text('Widget 1'), const Offset(0.0, -100.0));
    await tester.pump();
  });
}
