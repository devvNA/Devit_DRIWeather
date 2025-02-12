// ignore_for_file: avoid_print

import 'dart:developer';

import 'package:devit_driweather/app/data/repositories/weather_repositories.dart';
import 'package:get/get.dart';

class DetailWeatherController extends GetxController {
  final index = 2.obs;
  final city = Get.arguments;
  final weatherHourly = [].obs;
  final weatherDaily = [].obs;
  final isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    log('city: $city');
    fetchWeatherForecast();
  }

  void setIndex(int value) {
    index.value = value;
    log('index: $index');
  }

  Future<void> fetchWeatherForecast() async {
    isLoading.value = true;
    final data = await WeatherRepository().getWeatherForecast(location: city);
    weatherHourly.value = data['hourly'];
    weatherDaily.value = data['daily'];
    print('weatherHourly: $weatherHourly');
    print('weatherDaily: $weatherDaily');
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
