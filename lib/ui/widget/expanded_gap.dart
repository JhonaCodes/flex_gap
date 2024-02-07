import 'package:flutter/material.dart';

/// A custom version of the Flexible widget that represents an expanded space within a flex_gap layout.
///
/// `ExpandedGap` is a convenience widget to simplify the addition of an expanded space in a flex_gap layout.
/// It inherits from the Flexible widget with a FlexFit.tight configuration and a flex value of 1.
/// This results in the child (or an empty Offstage widget by default) expanding to fill available space.
///
/// Advantages of using ExpandedGap:
///
/// 1. **Simplicity**: Provides a concise way to create an expanded space within a flex_gap layout.
/// 2. **Configurability**: Inherits the flexibility of the Flexible widget, allowing for customization of fit and flex parameters.
/// 3. **flex_gap Integration**: Seamlessly integrates with the flex_gap layout for a consistent spacing solution.
///
class ExpandedGap extends Flexible {
  const ExpandedGap({super.key, Widget? child})
      : super(
            fit: FlexFit.tight,
            child: child ?? const SizedBox.shrink(),
            flex: 1);
}
