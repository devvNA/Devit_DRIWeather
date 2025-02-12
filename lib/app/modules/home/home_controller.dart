import 'dart:developer';

import 'package:devit_driweather/app/data/models/weather_model.dart';
import 'package:devit_driweather/app/data/repositories/weather_repositories.dart';
import 'package:geocode/geocode.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final isLoading = false.obs;
  final locationCity = "".obs;
  final geoCode = GeoCode();
  final dataWeather = Rxn<WeatherModel>();

  @override
  void onInit() {
    super.onInit();
    fetchWeather();
  }

  Future<void> fetchWeather({String? selectedCity}) async {
    isLoading.value = true;

    if (selectedCity != null) {
      locationCity.value = selectedCity;
    } else {
      Position location = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      log('location: ${location.latitude},${location.longitude}');
      try {
        Address address = await geoCode.reverseGeocoding(
          latitude: location.latitude,
          longitude: location.longitude,
        );

        locationCity.value = address.city!.split(' ').last;
        log('locationCity: ${locationCity.value}');
      } catch (e) {
        isLoading.value = false;
        log("Error getting address: $e");
        locationCity.value = 'Unable to fetch street name';
      }
    }

    dataWeather.value = await WeatherRepository().getWeather(
      location: locationCity.value,
    );
    isLoading.value = false;
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
