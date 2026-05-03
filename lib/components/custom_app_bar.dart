import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    required this.title,
    required this.icon,
    required this.onPressed,
  });

  final String title;
  final Icon icon;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title, style: TextStyle(color: Colors.white, fontSize: 30)),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 16.0),
          child: IconButton(
            onPressed: onPressed,
            icon: icon,
            color: Colors.white,
            iconSize: 30,
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
