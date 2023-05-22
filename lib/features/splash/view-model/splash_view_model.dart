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
    LocationPermission permission;

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        log('Location permissions are denied');
        return _determinePosition();
      }
    }

    if (permission == LocationPermission.deniedForever) {
      log('''Location permissions are permanently denied, we cannot request permissions.''');
      return _determinePosition();
    }
    _position = await Geolocator.getCurrentPosition();
  }
}
