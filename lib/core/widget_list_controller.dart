import 'package:flex_gap/render/box_gap.dart';
import 'package:flex_gap/ui/widget/expanded_gap.dart';
import 'package:flutter/material.dart';

/// [ProcessOnFor] Function type for processing elements in a list with an index.
///
/// The `ProcessOnFor` type represents a function that takes an integer index
/// as input and performs processing on each element of a list. It is typically
/// used as a parameter type for functions that iterate over a list and apply
/// operations or modifications to each element based on its index.
///
/// Example usage:
/// ```dart
///
/// void _function(ProcessOnFor processOnFor){
///     for (int i = 0; i < children.length; i++) {
///       final child = children[i];
///       processOnFor(i);
///       spacedChildren.add(child);
///     }
/// }
///
/// /// For use:
/// void processElement(int index) {
///   _function((index){
///   /// Print a current index
///   print(index);
///   });
/// }
/// ```
///
typedef ProcessOnFor = Function(int index);

/// [WidgetListController] Utility class for building children widgets with flexible spacing.
///
/// The `BuildChildrenFlexGap` class provides a convenient way to manipulate and
/// process a list of child widgets, applying flexible spacing and layout modifications
/// based on specified parameters. It encapsulates functionality for adding spacing,
/// flexible spaces, and other layout adjustments to a list of widgets.
///
/// Parameters:
///   - `children`: The list of child widgets to be processed and manipulated.
///   - `axis`: The axis (horizontal or vertical) along which to apply spacing and layout modifications.
///   - `startSpacerIndex`: The index at which to add a flexible space widget (if applicable).
///   - `globalSpace`: The amount of global spacing to be applied between elements.
///
/// Example usage:
/// ```dart
/// BuildChildrenFlexGap builder = BuildChildrenFlexGap(
///   children: childrenList,
///   axis: Axis.horizontal,
///   startSpacerIndex: 1,
///   globalSpace: 10.0,
/// );
/// List<Widget> processedChildren = builder.withGlobalSpace();
/// ```
///
class WidgetListController {
  final List<Widget> _children;
  final double? _globalSpace;
  final Axis? _axis;
  final Map<int, double> _locatedSpace;
  final int _startSpacerIndex;
  WidgetListController(this._children, this._axis, this._startSpacerIndex,
      this._globalSpace, this._locatedSpace);

  /// List of widgets for spacing and layout manipulation.
  ///
  /// This list contains widgets that are used for spacing and layout manipulation within
  /// the `BuildChildrenFlexGap` class. Each time this list is accessed, it is cleared
  /// before adding new elements based on the specified processing functions. This list
  /// is intended to store widgets that have been processed or modified based on the
  /// requirements of the `BuildChildrenFlexGap` class, such as adding space widgets
  /// or flexible spaces.
  ///
  final List<Widget> _spacedChildren = [];

  /// [withGlobalSpace] Adds a space widget to the `spacedChildren` list based on the specified global space value.
  ///
  /// This method checks if the `globalSpace` value is greater than 0. If it is, it calls the [_addSpaceByOrientation]
  /// function using the [_forList] method, which adds a space widget (either horizontal or vertical) to the `spacedChildren`
  /// list based on the current orientation (`axis`). The space widget is represented by a [RenderBoxGap] widget, which is a
  /// highly optimized element that adds space between elements in a layout.
  ///
  /// Returns:
  ///   A list of widgets with a space widget added if the `globalSpace` value is greater than 0.
  ///
  List<Widget> withGlobalSpace() => _forList(_addSPaceByOrientation);

  /// [withExpanded] Adds an [ExpandedGap] widget to the `spacedChildren` list if the `startSpacerIndex` is greater than 0.
  ///
  /// This method checks if the `startSpacerIndex` is greater than 0. If it is, it calls the [_addExpandedGap] function
  /// using the [_forList] method, which adds an [ExpandedGap] widget to the `spacedChildren` list at the specified index.
  /// The [ExpandedGap] widget represents a flexible space in a Flex layout and is commonly used to create flexible
  /// layouts with Flutter's Flex widgets.
  ///
  /// Returns:
  ///   A list of widgets with an [ExpandedGap] added if the `startSpacerIndex` is greater than 0.
  ///
  List<Widget> withExpanded() => _forList(_addExpandedGap);

  /// [withIndexSpace] Adds space widgets to the `spacedChildren` list based on specified indices.
  ///
  /// This method iterates over the list of children widgets and calls the [_addSpaceByIndex]
  /// method for each index contained in the `locatedSpace` map. The [_addSpaceByIndex] method
  /// adds a space widget to the `spacedChildren` list if the `locatedSpace` map contains a value
  /// for the current index. After processing all indices in the `locatedSpace` map, the method
  /// returns the updated `spacedChildren` list.
  ///
  /// Returns:
  ///   A list of widgets with space widgets added based on specified indices.
  ///
  List<Widget> withIndexSpace() => _forList(_addSpaceByIndex);

  /// Adds a space widget to the `spacedChildren` list based on the specified orientation.
  ///
  /// This method adds a space widget to the `spacedChildren` list if the current index
  /// is greater than 0. If the current index is greater than 0, it calls the [_addByAxis]
  /// method with the `globalSpace` value as the space parameter. The [_addByAxis] method then
  /// adds a [RenderBoxGap] widget to the `spacedChildren` list based on the current axis
  /// with the specified global space value.
  ///
  /// Parameters:
  ///   - `currentIndex`: The current index being processed.
  ///
  _addSPaceByOrientation(int currentIndex) {
    if (currentIndex > 0) _addByAxis(_globalSpace!);
  }

  /// Adds an [ExpandedGap] widget to the `spacedChildren` list at the specified index.
  ///
  /// This method adds an [ExpandedGap] widget to the `spacedChildren` list if the index
  /// matches the `startSpacerIndex` parameter. The [ExpandedGap] widget is an abstraction
  /// of [Flexible] and represents a flexible space in a Flex layout. It expands with default
  /// values and can only contain one child widget if required.
  ///
  /// This method is typically used to add a flexible space at a specific position in a list
  /// of widgets, such as when building a layout with flex containers.
  ///
  /// Parameters:
  ///   - `index`: The index at which to add the [ExpandedGap] widget.
  ///
  _addExpandedGap(int index) {
    if (index == _startSpacerIndex) {
      _spacedChildren.add(const ExpandedGap());
    }
  }

  /// Adds a space widget to the `spacedChildren` list based on the specified index.
  ///
  /// This method adds a space widget to the `spacedChildren` list if the `locatedSpace`
  /// map contains a value for the specified index. If a value is found in the `locatedSpace`
  /// map for the given index, it calls the [_addByAxis] method with the corresponding
  /// space value from the map. The [_addByAxis] method then adds a [RenderBoxGap] widget
  /// to the `spacedChildren` list based on the current axis with the specified space value.
  ///
  /// Parameters:
  ///   - `index`: The index at which to add the space widget.
  ///
  _addSpaceByIndex(int index) {
    if (_locatedSpace.containsKey(index)) _addByAxis(_locatedSpace[index]!);
  }

  List<Widget> indexSpaceGlobalSpaceAndOrScrollable() => _forList((index) {
        _addSpaceByIndex(index);
        _addSPaceByOrientation(index);
      });

  /// Iterates over the children list and applies a processing function to each element.
  ///
  /// This method iterates over the list of children widgets and applies a processing function
  /// provided by the parameter `processOnFor` to each element. The processing function is
  /// invoked with the index of the current element in the list. After processing, the element
  /// is added to a new list (`spacedChildren`). The original list is cleared before iterating
  /// over the children.
  ///
  /// Example:
  /// ```dart
  /// List<Widget> children = [...]; // List of widgets
  /// List<Widget> processedChildren = _forList((index) {
  ///   // Perform processing on each element, e.g., adding spacing
  ///   // based on the index or applying a transformation.
  /// });
  /// ```
  ///
  /// Parameters:
  ///   - `processOnFor`: A function that takes an integer index as input and performs
  ///     processing on each element of the list.
  ///
  /// Returns:
  ///   A list of widgets with the processing applied to each element.
  ///
  List<Widget> _forList(ProcessOnFor processOnFor) {
    _spacedChildren.clear();

    for (int i = 0; i < _children.length; i++) {
      final child = _children[i];
      processOnFor(i);
      _spacedChildren.add(child);
    }
    return _spacedChildren;
  }

  /// Adds a space widget to the `spacedChildren` list based on the specified axis.
  ///
  /// This method adds a space widget to the `spacedChildren` list based on the current
  /// orientation (`axis`). If the axis is horizontal, it adds a [RenderBoxGap] widget
  /// with the specified width; if the axis is vertical, it adds a [RenderBoxGap] widget
  /// with the specified height. The [RenderBoxGap] widget is a highly optimized element
  /// that represents a gap with either a specified width or height.
  ///
  /// Parameters:
  ///   - `space`: The amount of space to add (either width or height, depending on the axis).
  ///
  _addByAxis(double space) {
    if (_axis == Axis.horizontal) {
      _spacedChildren.add(RenderBoxGap(width: space));
    }
    if (_axis == Axis.vertical) {
      _spacedChildren.add(RenderBoxGap(height: space));
    }
  }
}
