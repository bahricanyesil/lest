import 'package:flutter/material.dart';

extension WidgetX on Widget {
  Widget wrapCircularSizedBox([double? sizeValue]) => SizedBox(
        width: sizeValue ?? 50,
        height: sizeValue ?? 50,
        child: const CircularProgressIndicator(),
      );
}
