import 'package:get/get.dart';

import '../modules/search_location/search_location_binding.dart';
import '../modules/search_location/search_location_page.dart';

class SearchLocationRoutes {
  SearchLocationRoutes._();

  static const searchLocation = '/search-location';

  static final routes = [
    GetPage(
      name: searchLocation,
      page: () => const SearchLocationPage(),
      binding: SearchLocationBinding(),
    ),
  ];
}
