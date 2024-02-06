import 'package:flutter/material.dart';
/// A custom version of the Flex widget that represents a flexible row or column in a flex_gap layout.
///
/// `Mainflex_gap` is designed to simplify the creation of a flexible row or column within a flex_gap layout.
/// It inherits from the Flex widget and allows for the easy configuration of the main axis direction, alignment, and children.
///
/// Advantages of using Mainflex_gap:
///
/// 1. **Simplicity**: Provides a straightforward way to create a flexible row or column in a flex_gap layout.
/// 2. **Integration**: Seamlessly integrates with the flex_gap layout for consistent spacing solutions.
/// 3. **Configurability**: Inherits the flexibility of the Flex widget, allowing for customization of the main axis, alignment, and more.
///
class MainFlexGap extends Flex{
  const MainFlexGap({
    super.key,
    required super.direction,
    required super.children,
    super.crossAxisAlignment,
    super.mainAxisAlignment,
  });
}