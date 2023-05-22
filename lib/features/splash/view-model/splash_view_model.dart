import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:lest/core/extensions/date_time_extensions.dart';
import 'package:lest/core/managers/local_storage_manager.dart';
import 'package:lest/product/constants/local_storage_keys.dart';

class SplashViewModel extends ChangeNotifier {
  late Position _position;
  Position get position => _position;

  static bool get isSignedIn {
    final signInDate =
        LocalStorage().getValue<DateTime>(LocalStorageKeys.signInDate);
    return signInDate.checkDeadline(const Duration(hours: 12));
  }

  Future<void> initializeApp() async {
    await _determinePosition();
  }

  Future<void> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) return log('Location services are disabled.');

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return log('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return log(
        '''Location permissions are permanently denied, we cannot request permissions.''',
      );
    }
    _position = await Geolocator.getCurrentPosition();
  }
}
