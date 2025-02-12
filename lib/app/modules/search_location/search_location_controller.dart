import 'package:get/get.dart';

class SearchLocationController extends GetxController {
  final searchText = ''.obs;
  final recentSearches = <String>[].obs;

  void searchLocation(String city) {
    if (city.isNotEmpty) {
      // if (!recentSearches.contains(city)) {
      //   recentSearches.insert(0, city);
      //   if (recentSearches.length > 5) {
      //     recentSearches.removeLast();
      //   }
      // }

      Get.back(result: city);
    }
  }

  @override
  void onInit() {
    super.onInit();
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
