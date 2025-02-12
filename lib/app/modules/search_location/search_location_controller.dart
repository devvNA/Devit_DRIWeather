import 'package:get/get.dart';

class SearchLocationController extends GetxController {
  final searchText = ''.obs;

  void searchLocation(String city) {
    if (city.isNotEmpty) {
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
