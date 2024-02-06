import 'package:flutter/material.dart';

/// A simple RenderBox widget that represents a gap with specified width and height.
///
/// `RenderBoxGap` is a lightweight widget used to apply space between elements in a flexible and customizable manner.
/// It is commonly utilized within a layout to add precise spacing without introducing additional visual elements.
///
/// * `width`: The width of the gap. Defaults to 0.0.
/// * `height`: The height of the gap. Defaults to 0.0.
///
/// Advantages of using RenderBoxGap:
///
/// 1. **Efficiency**: RenderBoxGap introduces minimal overhead, making it a lightweight option for applying spacing.
/// 2. **Precision**: Allows precise control over the width and height of the gap, enabling fine-grained layout adjustments.
/// 3. **Customization**: Can be easily incorporated into more complex layouts and custom rendering scenarios.
///
class RenderBoxGap extends LeafRenderObjectWidget {

  final double? width;
  final double? height;

  const RenderBoxGap({super.key, this.width = 0.0, this.height = 0.0});

  @override
  RenderObject createRenderObject(BuildContext context) => RenderGap(width: width, height: height);


  @override
  void updateRenderObject(BuildContext context, RenderGap renderObject) => renderObject
    ..height = height
    ..width = width;

}


class RenderGap extends RenderBox {
  double? width;
  double? height;
  RenderGap({this.width = 0.0, this.height = 0.0});

  @override
  void performLayout() => size = Size(width ?? 0.0, height ?? 0.0);


  @override
  void paint(PaintingContext context, Offset offset) {}

}