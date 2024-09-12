import 'package:flutter/material.dart';

class AppListAppBar extends StatelessWidget implements PreferredSizeWidget {
  const AppListAppBar({super.key, required this.title, this.action});

  final String title;
  final VoidCallback? action;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: InkWell(
        onTap: () => Navigator.of(context).pop(),
        child: const Icon(
          Icons.view_quilt_rounded,
          size: 35,
          // color: Colors.white,
        ),
      ),
      title: Text(title),
      actions: [
        IconButton(
          onPressed: action,
          icon: const Icon(
            Icons.add_circle,
            color: Colors.white,
            size: 35,
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
