import 'package:flex_gap/ui/widget/expanded_gap.dart';
import 'package:flex_gap/ui/widget/main_flex_gap.dart';
import 'package:flex_gap/ui/widget/scroll_gap.dart';
import 'package:flutter/material.dart';

import '../render/box_gap.dart';

/// A flexible and customizable widget that adds spacing between its children based on various configurations.
///
/// `flex_gap` allows you to create a row or column of widgets with customizable spacing between them.
///
/// * `children`: The list of widgets to be displayed.
/// * `axis`: The main axis direction. Defaults to [Axis.vertical].
/// * `startSpacerIndex`: The index from which to start applying an expanded space. Defaults to 0.
/// * `globalSpace`: The space to be applied between all elements. Defaults to 0.0.
/// * `locatedSpace`: A map where keys are indices and values are the space to be applied at the specified index.
/// * `crossAxisAlignment`: How the children should be placed relative to the cross axis. Defaults to [CrossAxisAlignment.start].
/// * `mainAxisAlignment`: How the children should be placed relative to the main axis. Defaults to [MainAxisAlignment.start].
/// * `isScrollable`: Determines whether the widget should be scrollable. Defaults to false.
/// * `physics`: The physics of the scrolling area. Defaults to [BouncingScrollPhysics].
/// * `isAdaptative`: Determines whether the widget should adapt its size based on available space. Defaults to false.
///
class FlexGap extends StatelessWidget {
  final List<Widget> children;
  final Axis? axis;
  final double globalSpace;
  final int startSpacerIndex;
  final CrossAxisAlignment? crossAxisAlignment;
  final MainAxisAlignment? mainAxisAlignment;

  /// Apply spacing between widgets starting from index 1 and ending at (n - 1).
  ///
  /// * Example:
  ///   {
  ///    1: 30,
  ///   }
  ///
  /// * Here, index 1 represents the widget, and 30 is the applied space.
  ///
  final Map<int, double> locatedSpace;
  final bool isScrollable;
  final ScrollPhysics? physics;

  /// Disclaimer:
  ///
  /// * This implementation it's under construction, Right now he's not on the best behavior.
  final bool isAdaptive;
  final ScrollController? scrollController;
  final bool scrollReverse;
  const FlexGap(
      {super.key,
      required this.children,
      this.axis,
      this.startSpacerIndex = 0,
      this.globalSpace = 0.0,
      this.locatedSpace = const {},
      this.crossAxisAlignment,
      this.mainAxisAlignment,
      this.isScrollable = false,
      this.physics,
      this.isAdaptive = false,
      this.scrollController,
      this.scrollReverse = false});

  @override
  Widget build(BuildContext context) {
    Widget dataWidget = MainFlexGap(
      direction: axis ?? Axis.vertical,
      crossAxisAlignment: crossAxisAlignment ?? CrossAxisAlignment.start,
      mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.start,
      children: _buildChildrenWithSpacing(),
    );

    return isScrollable
        ? ScrollGap(
            scrollDirection: axis ?? Axis.vertical,
            physics: physics ?? const BouncingScrollPhysics(),
            reverse: scrollReverse,
            controller: scrollController,
            child: dataWidget,
          )
        : dataWidget;
  }

  List<Widget> _buildChildrenWithSpacing() {
    /// Each time it is called the return value will be empty, so the elements do not accumulate in the list.
    List<Widget> spacedChildren = [];

    for (int i = 0; i < children.length; i++) {
      final child = children[i];

      /// Applies space between elements
      if (i > 0 && globalSpace > 0) {
        if (axis == Axis.horizontal)
          spacedChildren.add(RenderBoxGap(width: globalSpace));
        if (axis == Axis.vertical)
          spacedChildren.add(RenderBoxGap(height: globalSpace));
      }

      /// Applies space based on index
      if (locatedSpace.containsKey(i)) {
        if (axis == Axis.horizontal)
          spacedChildren.add(RenderBoxGap(width: locatedSpace[i]));
        if (axis == Axis.vertical)
          spacedChildren.add(RenderBoxGap(height: locatedSpace[i]));
      }

      if (startSpacerIndex > 0 && i == (startSpacerIndex))
        spacedChildren.add(const ExpandedGap());

      spacedChildren.add(child);
    }

    return isAdaptive
        ? [
            /// Todo: Implement the use of a new list with spaces in case of applying separation by indexes using spaceBetween
            ExpandedGap(
              child: Wrap(
                runSpacing: globalSpace,
                spacing: globalSpace,
                direction: axis ?? Axis.vertical,
                children: [...spacedChildren],
              ),
            ),
          ]
        : spacedChildren;
  }
}
