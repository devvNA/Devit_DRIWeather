import 'detail_weather_routes.dart';
import 'home_routes.dart';
import 'notification_routes.dart';
import 'onboard_routes.dart';
import 'search_location_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = '/onboard';

  static final routes = [
    ...HomeRoutes.routes,
    ...OnboardRoutes.routes,
    ...NotificationRoutes.routes,
    ...SearchLocationRoutes.routes,
    ...DetailWeatherRoutes.routes,
  ];
}
