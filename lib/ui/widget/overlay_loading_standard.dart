import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:teste_ava/colors.dart';

class OverlayLoadingStandard extends StatelessWidget {
  const OverlayLoadingStandard(
      {required this.child, required this.isVisible, super.key});

  final Widget child;
  final bool isVisible;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        child,
        Visibility(
          visible: isVisible,
          child: Container(
            height: double.infinity,
            width: double.infinity,
            color: Colors.grey.withOpacity(0.7),
            child: Center(
              child: SizedBox(
                height: 250,
                width: MediaQuery.of(context).size.width / 1.5,
                child: Shimmer.fromColors(
                  baseColor: AvaColor.appPrimarySwatch,
                  highlightColor: AvaColor.defaultRedColor,
                  child: Image.asset(
                    'assets/images/logo.png',
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
