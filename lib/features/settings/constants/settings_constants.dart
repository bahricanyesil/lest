import 'package:flutter/widgets.dart';

/// Collection of texts in the settings screen.
mixin SettingsTexts on StatelessWidget {
  /// Social media accounts.
  static final List<SocialMediaModel> socialMediaAccounts = <SocialMediaModel>[
    SocialMediaModel(nameKey: 'email', link: _emailUri.toString()),
    const SocialMediaModel(
      nameKey: 'logo',
      link: 'https://github.com/bahricanyesil/lest',
    ),
    const SocialMediaModel(
      nameKey: 'github',
      link: 'https://github.com/bahricanyesil/lest',
    ),
  ];

  static Uri get _emailUri => Uri(
        scheme: 'mailto',
        path: 'bahricanyesil@gmail.com',
        query: _encodeQueryParameters(<String, String>{
          'subject': 'LEST App!',
        }),
      );

  static String? _encodeQueryParameters(Map<String, String> params) =>
      params.entries
          .map(
            (MapEntry<String, String> e) =>
                '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}',
          )
          .join('&');

  static const String appInfoDescription1 =
      'LEST aims to connect local producers with vendors to promote sustainable and ethical sourcing of products and create a more diverse market. 🤝🏻';
  static const String appInfoDescription2 =
      'The world is becoming increasingly connected, and the need for sustainable and ethical sourcing of products is on the rise. 📎';
  static const String appInfoDescription3 =
      'In response to this trend, our project aims to provide a platform that connects local producers with vendors. 🥳';
  static const String appInfoDescription4 =
      'We recognize that there is a significant gap in the market for a platform that caters to all local producers, not just those in the agricultural sector. 🧑‍🤝‍🧑';
  static const List<String> infoSentences = [
    appInfoDescription1,
    appInfoDescription2,
    appInfoDescription3,
    appInfoDescription4,
  ];
}

/// Model for social media accounts.
class SocialMediaModel {
  /// Default constructor for [SocialMediaModel].
  const SocialMediaModel({required this.nameKey, required this.link});

  /// Key for the name of the social media type.
  final String nameKey;

  /// Link to the social media.
  final String link;
}
