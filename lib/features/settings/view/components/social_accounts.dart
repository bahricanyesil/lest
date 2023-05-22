import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:lest/features/settings/constants/settings_constants.dart';
import 'package:url_launcher/url_launcher_string.dart';

class SocialAccounts extends StatelessWidget {
  const SocialAccounts({super.key});

  @override
  Widget build(BuildContext context) => Row(
        children: List<Widget>.generate(
          SettingsTexts.socialMediaAccounts.length,
          (int i) => _item(i, context),
        ),
      );

  Widget _item(int i, BuildContext context) {
    final account = SettingsTexts.socialMediaAccounts[i];
    return Expanded(
      child: IconButton(
        padding: const EdgeInsets.all(3),
        onPressed: () async {
          if (await canLaunchUrlString(account.link)) {
            await launchUrlString(account.link);
          } else {
            log('CAN NOT LAUNCH URL');
          }
        },
        icon: Image.asset(
          'assets/images/${account.nameKey}.png',
          color: i == 2 ? Colors.black : null,
          width: 40,
        ),
        splashRadius: 25,
      ),
    );
  }
}
