import 'package:flex_gap/ui/widget/expanded_gap.dart';
import 'package:flex_gap/ui/widget/main_flex_gap.dart';
import 'package:flex_gap/ui/widget/scroll_gap.dart';
import 'package:flutter/material.dart';

import '../core/widget_list_controller.dart';

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
  final bool isScrollableWithReverse;
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
      this.isScrollableWithReverse = false});

  @override
  Widget build(BuildContext context) {
    Widget dataWidget = MainFlexGap(
      direction: axis ?? Axis.vertical,
      crossAxisAlignment: crossAxisAlignment ?? CrossAxisAlignment.start,
      mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.start,
      children: _buildChildrenWithSpacing(),
    );

    if (isScrollable || isScrollableWithReverse) {
      return ScrollGap(
        scrollDirection: axis ?? Axis.vertical,
        physics: physics ?? const BouncingScrollPhysics(),
        reverse: isScrollableWithReverse,
        controller: scrollController,
        child: dataWidget,
      );
    }

    return dataWidget;
  }

  /// TODO: Need implement a handler here..
  List<Widget> _buildChildrenWithSpacing() {
    WidgetListController controller = WidgetListController(
      children,
      axis,
      startSpacerIndex,
      globalSpace,
      locatedSpace,
    );

    if (startSpacerIndex > 0 &&
        !isScrollable &&
        !isScrollableWithReverse &&
        !isAdaptive) return controller.withExpanded();

    if (globalSpace > 0 && !isAdaptive && locatedSpace.isEmpty) {
      return controller.withGlobalSpace();
    }

    if (locatedSpace.isNotEmpty && !isAdaptive && globalSpace == 0) {
      return controller.withIndexSpace();
    }

    if (isAdaptive && !isScrollableWithReverse && !isScrollable) {
      return [
        ExpandedGap(
          child: Wrap(
            runSpacing: globalSpace,
            spacing: globalSpace,
            direction: axis ?? Axis.vertical,
            children: [
              if (locatedSpace.isNotEmpty) ...controller.withIndexSpace(),
              if (locatedSpace.isEmpty) ...children,
            ],
          ),
        ),
      ];
    }

    return controller.indexSpaceGlobalSpaceAndOrScrollable();
  }
}
