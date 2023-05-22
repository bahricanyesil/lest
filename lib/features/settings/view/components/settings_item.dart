import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:lest/core/extensions/context_extensions.dart';
import 'package:lest/core/widgets/button/custom_pop_menu_button.dart';
import 'package:lest/features/settings/constants/settings_constants.dart';
import 'package:lest/features/settings/view/components/social_accounts.dart';
import 'package:lest/product/constants/language_options.dart';
import 'package:lest/product/constants/settings_options.dart';
import 'package:lest/product/constants/theme_types.dart';
import 'package:lest/product/theme/custom_colors.dart';

class SettingsItem extends StatefulWidget {
  const SettingsItem({required this.settings, super.key});
  final SettingsOptions settings;

  @override
  State<SettingsItem> createState() => _SettingsItemState();
}

class _SettingsItemState extends State<SettingsItem> {
  LanguageOptions _selectedLang = LanguageOptions.en;
  ThemeTypes _theme = ThemeTypes.light;

  void safeSetState(VoidCallback callback) {
    if (!mounted) return;
    setState(callback);
  }

  @override
  Widget build(BuildContext context) => Theme(
        data: Theme.of(context).copyWith(
          dividerColor: Colors.transparent,
          highlightColor: CustomColors.primaryColor.withOpacity(.15),
          hoverColor: CustomColors.primaryColor,
        ),
        child: ListTileTheme(
          minLeadingWidth: 0,
          minVerticalPadding: 0,
          dense: true,
          tileColor: CustomColors.primaryColor.withOpacity(.3),
          selectedTileColor: CustomColors.primaryColor,
          child: _expansionTile(context),
        ),
      );

  Widget _expansionTile(BuildContext context) => ExpansionTile(
        collapsedTextColor: Colors.white70,
        collapsedIconColor: Colors.white70,
        initiallyExpanded: widget.settings == SettingsOptions.appInfo ||
            widget.settings == SettingsOptions.socialInfo,
        tilePadding: const EdgeInsets.symmetric(horizontal: 10),
        childrenPadding:
            const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
        leading: Icon(widget.settings.icon, color: Colors.black),
        title: _title(context),
        subtitle: _subtitle(context),
        expandedCrossAxisAlignment: CrossAxisAlignment.start,
        expandedAlignment: Alignment.centerLeft,
        children: _children(context),
      );

  List<Widget> _children(BuildContext context) {
    switch (widget.settings) {
      case SettingsOptions.language:
        return <Widget>[_languageRow(context)];
      case SettingsOptions.theme:
        return <Widget>[_themeRow(context)];
      case SettingsOptions.appInfo:
        return _infoTexts(context);
      case SettingsOptions.socialInfo:
        return <Widget>[const SocialAccounts()];
    }
  }

  Widget _languageRow(BuildContext context) {
    const langValues = LanguageOptions.values;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text('Selected Language: ', style: context.bodyL),
        PopMenuButton(
          values: List<String>.generate(
            langValues.length,
            (int i) => langValues[i].languageName,
          ),
          width: 120,
          translated: false,
          selectedValue: _selectedLang.languageName,
          icon: _langIconPath(_selectedLang.name),
          icons: List<String>.generate(
            langValues.length,
            (int i) => _langIconPath(langValues[i].name),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 1, vertical: .2),
          alignment: Alignment.center,
          decoration:
              BoxDecoration(border: Border.all(color: Colors.white, width: .7)),
          onTap: (String val) => safeSetState(() {
            _selectedLang = LanguageOptions.values.firstWhere(
              (LanguageOptions element) => element.languageName == val,
            );
          }),
        ),
      ],
    );
  }

  Widget _themeRow(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text('Dark Mode', style: context.bodyL),
        FlutterSwitch(
          width: 75,
          // height: 25,
          valueFontSize: 14,
          // toggleSize: 6.5,
          value: _theme == ThemeTypes.dark,
          // borderRadius: 25,
          // padding: 1.5,
          activeColor: CustomColors.primaryColor.withOpacity(.7),
          showOnOff: true,
          activeIcon: const Icon(Icons.dark_mode_outlined, color: Colors.black),
          inactiveIcon:
              const Icon(Icons.light_mode_outlined, color: Colors.black),
          activeText: 'ON',
          inactiveText: 'OFF',
          onToggle: (bool val) => safeSetState(
            () => _theme = val ? ThemeTypes.dark : ThemeTypes.light,
          ),
        ),
      ],
    );
  }

  String _langIconPath(String lang) => 'assets/flags/$lang.png';

  List<Widget> _infoTexts(BuildContext context) => List<Padding>.generate(
        SettingsTexts.infoSentences.length,
        (int i) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 2),
            child: Text(
              SettingsTexts.infoSentences.elementAt(i),
            ),
          );
        },
      );

  Widget _title(BuildContext context) => Text(
        widget.settings.title,
        textAlign: TextAlign.start,
        style: const TextStyle(color: Colors.black),
      );

  Widget _subtitle(BuildContext context) => Text(
        widget.settings.subtitle,
        textAlign: TextAlign.start,
        style: context.labelM,
      );
}
