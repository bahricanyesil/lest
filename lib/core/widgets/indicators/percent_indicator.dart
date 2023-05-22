import 'package:flutter/material.dart';
import 'package:lest/core/extensions/widget_extensions.dart';

class PercentIndicator extends StatelessWidget {
  const PercentIndicator({required this.percentage, super.key});
  final double percentage;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        CircularProgressIndicator(value: percentage / 100)
            .wrapCircularSizedBox(),
        Center(
          child: Text(
            '${percentage.toInt()}%',
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
