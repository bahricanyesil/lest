import 'package:flutter/material.dart';
import 'package:lest/core/extensions/context_extensions.dart';
import 'package:lest/product/theme/custom_colors.dart';

class TextWithIcon extends StatelessWidget {
  const TextWithIcon({
    required this.iconData,
    required this.text,
    this.iconColor,
    this.textStyle,
    super.key,
  });
  final IconData iconData;
  final String text;
  final Color? iconColor;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) => Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Icon(
            iconData,
            color: iconColor ?? CustomColors.secondaryColor,
            size: 16,
          ),
          Text(
            text,
            style: context.bodyM.copyWith(color: Colors.white).merge(textStyle),
          ),
        ],
      );
}
