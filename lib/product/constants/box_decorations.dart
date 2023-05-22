import 'package:flutter/material.dart';
import 'package:lest/product/theme/custom_colors.dart';

mixin BoxDeco {
  static BoxDecoration get primaryRounded => BoxDecoration(
        color: CustomColors.primaryColor.withOpacity(.85),
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: CustomColors.secondaryColor.withOpacity(0.2),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      );
}
