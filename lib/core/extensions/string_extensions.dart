import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

extension StringX on String? {
  bool uncaseEqual(String? otherString) {
    if (this == null || otherString == null) return false;
    return this?.toLowerCase() == otherString.toLowerCase();
  }

  bool uncaseContains(String? query) {
    if (this == null || query == null) return false;
    return this!.toLowerCase().contains(query.toLowerCase());
  }

  bool uncaseStartsWith(String? query) {
    if (this == null || query == null) return false;
    return this!.toLowerCase().startsWith(query.toLowerCase());
  }

  CachedNetworkImage coveredNetworkImage({
    double? width,
    double? height,
    BoxFit? boxFit,
  }) =>
      CachedNetworkImage(
        imageUrl: this ?? '',
        width: width ?? double.infinity,
        height: height,
        fit: boxFit ?? BoxFit.cover,
        alignment: Alignment.topCenter,
        placeholder: (_, __) =>
            const Center(child: CircularProgressIndicator()),
      );
}
