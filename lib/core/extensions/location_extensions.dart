import 'dart:developer';

import 'package:geolocator/geolocator.dart';

extension LocationX on Position {
  String get locationString => '$latitude,$longitude';

  double distance(double? lat, double? lon) {
    if (lat == null || lon == null) {
      log('Lat or Lon is null so returning 0.0');
      return 0;
    }
    return Geolocator.distanceBetween(latitude, longitude, lat, lon) / 1000;
  }

  String distanceFormatted(double? lat, double? lon) {
    final calculatedDistance = distance(lat, lon);
    if (calculatedDistance.toString().split('.')[0].length > 2) {
      return calculatedDistance.toInt().toString();
    }

    return calculatedDistance.toStringAsFixed(1);
  }
}
