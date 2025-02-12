import 'package:get/get.dart';

import '../modules/detail_weather/detail_weather_binding.dart';
import '../modules/detail_weather/detail_weather_page.dart';

class DetailWeatherRoutes {
  DetailWeatherRoutes._();

  static const detailWeather = '/detail-weather';

  static final routes = [
    GetPage(
      name: detailWeather,
      page: () => const DetailWeatherPage(),
      binding: DetailWeatherBinding(),
    ),
  ];
}
