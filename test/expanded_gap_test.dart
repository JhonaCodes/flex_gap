import 'package:flex_gap/flex_gap.dart';
import 'package:flex_gap/ui/widget/expanded_gap.dart';

import 'package:flutter/material.dart';

import 'package:flutter_test/flutter_test.dart';

void main(){

  testWidgets('ExpandedGap expands horizontal', (WidgetTester tester) async {
    await tester.pumpWidget(
      const _BaseTestExpanded(
        child: Flex(
          direction: Axis.horizontal,
          children: [
            SizedBox(width: 100.0, height: 100.0), // Non-expanded widget
            ExpandedGap(child: SizedBox(width: 100.0, height: 100.0)),
          ],
        ),
      ),
    );

    // Find the RenderBox render box associated with the ExpandedGap
    final RenderBox renderBox = tester.renderObject(find.byType(ExpandedGap));

    // Expectations
    // Adjust expectations based on your widget logic
    expect(renderBox.size.width, equals(200.0));// Assuming horizontal expansion
    expect(renderBox.size.height, equals(100.0));
  });

  testWidgets('ExpandedGap expands vertical', (WidgetTester tester) async {
    await tester.pumpWidget(
      const _BaseTestExpanded(
        child: Flex(
          direction: Axis.vertical,
          children: [
            SizedBox(width: 100.0, height: 100.0), // Non-expanded widget
            ExpandedGap(child: SizedBox(width: 100.0, height: 100.0)),
          ],
        ),
      ),
    );

    // Find the RenderBox render box associated with the ExpandedGap
    final RenderBox renderBox = tester.renderObject(find.byType(ExpandedGap));

    // Expectations
    // Adjust expectations based on your widget logic
    expect(renderBox.size.width, equals(100.0));
    expect(renderBox.size.height, equals(200.0)); // Assuming vertical expansion
  });
}


class _BaseTestExpanded extends StatelessWidget {
  final Widget child;
  const _BaseTestExpanded({required this.child});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SizedBox(
          height: 300,
          width: 300,
          child: child
        ),
      ),
    );
  }
}
