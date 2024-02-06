import 'package:flex_gap/flex_gap.dart';
import 'package:flex_gap/render/box_gap.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('RenderBoxGap performs layout correctly',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: Directionality(
            textDirection: TextDirection.ltr,
            child: RenderBoxGap(width: 50.0, height: 30.0),
          ),
        ),
      ),
    );

    // Find the RenderBoxGap render box
    final RenderBox renderBox = tester.renderObject(find.byType(RenderBoxGap));

    // Perform layout
    renderBox.layout(BoxConstraints.tight(const Size(50.0, 30.0)));

    // Expectations
    expect(renderBox.size, equals(const Size(50.0, 30.0)));
  });
}
