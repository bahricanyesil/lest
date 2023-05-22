import 'dart:math';

mixin StringHelpers {
  static const chars = 'abcdefghijklmnopqrstuvwxyz';

  static String generateRandom({int? length}) => String.fromCharCodes(
        Iterable.generate(
          length ?? 8,
          (_) => chars.codeUnitAt(Random().nextInt(chars.length)),
        ),
      );
}
