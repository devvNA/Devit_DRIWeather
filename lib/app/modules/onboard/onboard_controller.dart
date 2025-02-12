// ignore_for_file: avoid_print

import 'package:devit_driweather/app/routes/home_routes.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

class OnboardController extends GetxController {
  //TODO: Implement OnboardController.

  @override
  void onInit() {
    super.onInit();
  }

  Future<void> locationPermission() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Jika pengguna menolak izin, tampilkan pesan atau lakukan tindakan lain
        print('Location permissions are denied');

        return;
      }
    } else {
      Get.toNamed(HomeRoutes.home);
    }
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
