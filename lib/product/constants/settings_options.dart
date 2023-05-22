import 'package:flutter/material.dart';

/// Represents the settings options.
enum SettingsOptions {
  theme(
    'Theme',
    'You can switch between light and dark themes.',
    Icons.color_lens_outlined,
  ),
  language(
    'Language',
    'You can use the app with your native language!',
    Icons.language_outlined,
  ),
  appInfo('App Info', 'Confused about how to use app?', Icons.info_outline),
  socialInfo(
    'Social Account Info',
    'You can contact with us via these channels.',
    Icons.contact_mail_outlined,
  );

  const SettingsOptions(this.title, this.subtitle, this.icon);
  final String title;
  final String subtitle;
  final IconData icon;
}
