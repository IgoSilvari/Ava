import 'package:flutter/material.dart';

class AppBarBackground extends StatelessWidget implements PreferredSizeWidget {
  const AppBarBackground({ 
    required this.title,
    this.onPressedActions,
    this.onPressedLeading,
    this.isVisibleLeading = true,
    this.isVisibleDrawer = false,
    this.isVisibleActions = false,
    super.key,
  });

  final String title;
  final void Function()? onPressedLeading;
  final void Function()? onPressedActions;
  final bool isVisibleLeading;
  final bool isVisibleDrawer;
  final bool isVisibleActions;

  @override
  Size get preferredSize => const Size.fromHeight(90);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      toolbarHeight: 90,
      leading: Visibility(
        visible: isVisibleLeading,
        child: Visibility(
          visible: isVisibleDrawer,
          replacement: IconButton(
            onPressed: onPressedLeading,
            icon: const Icon(
              Icons.arrow_back_ios,
              size: 28,
            ),
          ),
          child: IconButton(
            onPressed: onPressedLeading,
            icon: const Icon(
              Icons.menu,
              size: 28,
            ),
          ),
        ),
      ),
      actions: [
        Visibility(
          visible: isVisibleActions,
          child: IconButton(
            onPressed: onPressedActions,
            icon: const Icon(
              Icons.add,
              size: 28,
            ),
          ),
        ),
      ],
      title: Text(
        title,
      ),
      titleTextStyle: const TextStyle(
        fontSize: 30,
      ),
      centerTitle: true,
    );
  }
}
