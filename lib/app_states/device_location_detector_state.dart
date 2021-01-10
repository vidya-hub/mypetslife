import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/all.dart';
import 'package:geocoder/geocoder.dart';
import 'package:geocoder/model.dart';
import 'package:geolocator/geolocator.dart';

final deviceLocationProvider =
    ChangeNotifierProvider<DeviceLocationDetector>((_) {
  return DeviceLocationDetector();
});

class DeviceLocationDetector extends ChangeNotifier {
  String _phoneCountryCode;

  String get getPhoneCountryCode => _phoneCountryCode;

  DeviceLocationDetector() {
    getCountryName();
  }

  Future<String> getCountryName() async {
    try {
      Position position = await Geolocator()
          .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
      final coordinates =
          new Coordinates(position.latitude, position.longitude);
      var addresses =
          await Geocoder.local.findAddressesFromCoordinates(coordinates);
      var first = addresses.first;
      _phoneCountryCode = first.countryCode.toLowerCase();
      notifyListeners();
      return first.countryCode.toLowerCase(); // this will retu
    } catch (e) {
      return null;
    }
  }
}
