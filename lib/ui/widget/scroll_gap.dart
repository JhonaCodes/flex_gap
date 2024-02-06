import 'package:flutter/material.dart';

/// A customized version of SingleChildScrollView that provides additional flexibility within a flex_gap layout.
///
/// `ScrollGap` is a specialized widget that extends SingleChildScrollView to enhance its compatibility
/// with the flex_gap layout. It allows for easy scrolling in either the horizontal or vertical direction
/// while maintaining consistent spacing between elements in the flex_gap.
///
/// Advantages of using ScrollGap:
///
/// 1. **flex_gap Compatibility**: Seamlessly integrates with the flex_gap layout for a unified spacing solution.
/// 2. **Scrolling Flexibility**: Retains the scrolling capabilities of SingleChildScrollView within the flex_gap context.
/// 3. **Customization**: Inherits the properties of SingleChildScrollView, allowing for further customization.
///
class ScrollGap extends SingleChildScrollView {
  const ScrollGap({
    super.key,
    super.child,
    super.controller,
    super.physics,
    super.scrollDirection,
    super.reverse,
  });
}
