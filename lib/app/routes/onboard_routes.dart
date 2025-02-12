import 'package:get/get.dart';

import '../modules/onboard/onboard_binding.dart';
import '../modules/onboard/onboard_page.dart';

class OnboardRoutes {
  OnboardRoutes._();

  static const onboard = '/onboard';

  static final routes = [
    GetPage(
      name: onboard,
      page: () => const OnboardPage(),
      binding: OnboardBinding(),
    ),
  ];
}
