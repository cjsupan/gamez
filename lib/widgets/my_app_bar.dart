import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  const MyAppBar({super.key, this.title = ''});

  @override
  Size get preferredSize => const Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: Text(title == '' ? 'Gamerz' : title,
          style: const TextStyle(
              color: Colors.white, fontSize: 32, fontWeight: FontWeight.bold)),
      actions: [
        IconButton(
          icon: const Icon(Icons.settings, color: Colors.white),
          onPressed: () => {print('Settings button pressed!')},
        ),
      ],
    );
  }
}
