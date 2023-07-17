import 'package:flutter/material.dart';
import 'package:teste_ava/colors.dart';
import 'package:teste_ava/ui/widget/app_bar_background.dart';

class BackgraundDefaut extends StatelessWidget {
  const BackgraundDefaut({
    required this.child,
    required this.title,
    this.onPressedActions,
    this.onPressedLeading,
    this.top = 40,
    this.isVisibleLeading = true,
    this.isTwoRoundedEdges = false,
    this.isVisibleDrawer = false,
    this.isVisibleActions = false,
    super.key,
  });

  final Widget child;
  final String title;
  final double top;
  final bool isVisibleLeading;
  final bool isVisibleDrawer;
  final bool isTwoRoundedEdges;
  final bool isVisibleActions;
  final void Function()? onPressedLeading;
  final void Function()? onPressedActions;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        DecoratedBox(
          decoration: BoxDecoration(gradient: AvaColor.linearGradient),
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
          ),
        ),
        Column(
          children: [
            AppBarBackground(
              onPressedLeading: onPressedLeading,
              onPressedActions: onPressedActions,
              title: title,
              isVisibleLeading: isVisibleLeading,
              isVisibleDrawer: isVisibleDrawer,
              isVisibleActions: isVisibleActions,
            ),
            Expanded(
              child: Card(
                margin: EdgeInsets.zero,
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: twoRoundedEdges(isTwoRoundedEdges),
                ),
                child: Container(
                  padding: EdgeInsets.only(
                    top: top,
                    left: 15,
                    right: 15,
                  ),
                  height: MediaQuery.sizeOf(context).height + 90,                 
                  child: child,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  BorderRadiusGeometry twoRoundedEdges(bool isTrue) {
    switch (isTrue) {
      case true:
        return const BorderRadius.only(
          topLeft: Radius.circular(50),
          topRight: Radius.circular(50),
        );
      case false:
        return const BorderRadius.only(
          topLeft: Radius.circular(100),
        );
    }
  }
}
