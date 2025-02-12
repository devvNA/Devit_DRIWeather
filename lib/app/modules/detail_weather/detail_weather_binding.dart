import 'package:get/get.dart';

import 'detail_weather_controller.dart';

class DetailWeatherBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailWeatherController>(
      () => DetailWeatherController(),
    );
  }
}
