import 'package:flutter/material.dart';

// An app bar that can be used throughout the app
class GlobalAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(kBottomNavigationBarHeight);
  const GlobalAppBar({Key? key, required this.title, required this.onTap})
      : super(key: key);
  final String title;
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      elevation: 0,
      backgroundColor: Colors.white,
      leading: IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: onTap,
        color: Colors.grey,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 15.0,
          color: Colors.black,
        ),
      ),
    );
  }
}
