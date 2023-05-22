import 'package:flutter/material.dart';

extension LoadingProgressX on ImageChunkEvent {
  double? get percent => expectedTotalBytes != null
      ? (cumulativeBytesLoaded / expectedTotalBytes!) * 100
      : null;
}
