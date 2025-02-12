import 'package:get/get.dart';

import 'search_location_controller.dart';

class SearchLocationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SearchLocationController>(
      () => SearchLocationController(),
    );
  }
}
