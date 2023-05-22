import 'package:flutter/material.dart';

class ClipRoundedOnly extends ClipRRect {
  ClipRoundedOnly({
    required Widget super.child,
    this.cornerTypes = CornerTypes.values,
    this.radius = 8,
    super.key,
  }) : super(
          borderRadius: BorderRadius.only(
            topLeft: cornerTypes.tlRadius(radius),
            topRight: cornerTypes.trRadius(radius),
            bottomLeft: cornerTypes.blRadius(radius),
            bottomRight: cornerTypes.brRadius(radius),
          ),
        );

  final double radius;
  final List<CornerTypes> cornerTypes;
}

enum CornerTypes {
  topLeft,
  topRight,
  bottomLeft,
  bottomRight;
}

mixin CornerTypeLists {
  static const List<CornerTypes> all = [
    CornerTypes.topLeft,
    CornerTypes.topRight,
    CornerTypes.bottomLeft,
    CornerTypes.bottomRight,
  ];

  static const List<CornerTypes> tlr = [
    CornerTypes.topLeft,
    CornerTypes.topRight,
  ];

  static const List<CornerTypes> blr = [
    CornerTypes.bottomLeft,
    CornerTypes.bottomRight,
  ];

  static const List<CornerTypes> l = [
    CornerTypes.topLeft,
    CornerTypes.bottomLeft,
  ];

  static const List<CornerTypes> r = [
    CornerTypes.topRight,
    CornerTypes.bottomRight,
  ];
}

extension CornerTypesListX on List<CornerTypes> {
  bool get hasLT => contains(CornerTypes.topLeft);
  bool get hasRT => contains(CornerTypes.topRight);
  bool get hasLB => contains(CornerTypes.bottomLeft);
  bool get hasRB => contains(CornerTypes.bottomRight);

  Radius tlRadius(double val) => hasLT ? Radius.circular(val) : Radius.zero;
  Radius trRadius(double val) => hasRT ? Radius.circular(val) : Radius.zero;
  Radius blRadius(double val) => hasLB ? Radius.circular(val) : Radius.zero;
  Radius brRadius(double val) => hasRB ? Radius.circular(val) : Radius.zero;
}
