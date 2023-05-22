import 'package:flutter/material.dart';

enum BottomNavBarItemTypes {
  home(Icons.home_outlined, Icons.home_filled, 'Home', 0),
  chat(Icons.chat_outlined, Icons.chat, 'Chat', 1),
  profile(Icons.person_outline, Icons.person, 'Profile', 2),
  settings(Icons.settings_outlined, Icons.settings, 'Settings', 3);

  const BottomNavBarItemTypes(
    this.icon,
    this.filledIcon,
    this.text,
    this.itemIndex,
  );
  final IconData icon;
  final IconData filledIcon;
  final String text;
  final int itemIndex;
}
