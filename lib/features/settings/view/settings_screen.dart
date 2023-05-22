import 'package:flutter/material.dart';
import 'package:lest/core/widgets/appbar/appbar.dart';
import 'package:lest/features/settings/view/components/settings_item.dart';
import 'package:lest/product/constants/settings_options.dart';
import 'package:lest/product/theme/custom_colors.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key}) : super();

  @override
  Widget build(BuildContext context) {
    final optionLength = SettingsOptions.values.length;
    return Scaffold(
      appBar: const CustomAppBar(title: 'Settings'),
      body: ListView.builder(
        itemCount: optionLength + 1,
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) => index == optionLength
            ? const Padding(
                padding: EdgeInsets.only(top: 4),
                child: Text(
                  'Made with 💚 by LEST Team',
                  textAlign: TextAlign.center,
                ),
              )
            : Column(
                children: <Widget>[
                  SettingsItem(settings: SettingsOptions.values[index]),
                  Divider(
                    color: CustomColors.secondaryColor,
                    thickness: .3,
                    height: .3,
                  ),
                ],
              ),
      ),
    );
  }
}
