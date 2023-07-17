import 'package:flutter/material.dart';
import 'package:teste_ava/colors.dart';

class IconButtonMap extends StatelessWidget {
  const IconButtonMap({required this.onPressed, required this.icons,super.key});

  final void Function()? onPressed;
  final IconData icons;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: Icon(
        icons,
        color: AvaColor.appPrimarySwatch,
      ),
    );
  }
}
