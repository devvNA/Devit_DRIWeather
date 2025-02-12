import 'package:devit_driweather/app/core/helpers/weather_utils.dart';
import 'package:devit_driweather/app/core/widgets/custom_button.dart';
import 'package:devit_driweather/app/routes/detail_weather_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../routes/search_location_routes.dart';
import 'home_controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        return Stack(
          children: [
            _buildBackground(),
            RefreshIndicator(
              color: Color(0xFF52B2E8),
              backgroundColor: Colors.white,
              onRefresh: () async {
                controller.fetchWeather();
              },
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics()),
                child: Column(
                  children: [
                    _buildHeader(),
                    _buildWeatherImage(),
                    const SizedBox(height: 32.0),
                    _buildWeatherCard(),
                    const SizedBox(height: 42.0),
                    CustomButton(
                      title: "Weather Details",
                      onTap: () {
                        Get.toNamed(DetailWeatherRoutes.detailWeather,
                            arguments: controller.locationCity.value);
                      },
                    ),
                    const SizedBox(height: 32.0),
                  ],
                ),
              ),
            ),
            if (controller.isLoading.value)
              Center(
                child: Container(
                  height: MediaQuery.sizeOf(context).height,
                  color: Colors.black12,
                  alignment: Alignment.center,
                  child: SizedBox(
                    width: 32,
                    height: 32,
                    child: CircularProgressIndicator(
                      color: Colors.white,
                    ),
                  ),
                ),
              )
          ],
        );
      }),
    );
  }

  Widget _buildBackground() {
    return Image.asset(
      height: Get.height,
      width: Get.width,
      "assets/images/home-bg.png",
      fit: BoxFit.cover,
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 48),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset("assets/icons/ic-location.svg"),
          const SizedBox(width: 12.0),
          Text(
            controller.locationCity.value,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              shadows: [
                Shadow(
                  color: Colors.black.withOpacity(0.1),
                  offset: Offset(-2, 3),
                  blurRadius: 1,
                ),
              ],
            ),
          ),
          _buildSearchButton(),
          Spacer(),
          InkWell(
            onTap: () {
              showModalBottomSheet(
                context: Get.context!,
                backgroundColor: Colors.white,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
                ),
                builder: (context) => Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Container(
                          width: 40,
                          height: 2,
                          decoration: BoxDecoration(
                            color: Color(0xFF78809C),
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),
                      Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Your notification',
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF444E72),
                                  shadows: [
                                    Shadow(
                                      color:
                                          Color(0xFF444E72).withOpacity(0.15),
                                      offset: Offset(-2, 3),
                                      blurRadius: 1,
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 16),
                              const Text(
                                'New',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Color(0xFF444E72),
                                ),
                              ),
                              const SizedBox(height: 16),
                              _buildNotificationItem(
                                isNew: true,
                                icon: 'assets/icons/ic-sun.svg',
                                time: '10 minutes ago',
                                message:
                                    'A sunny day in your location, consider wearing your UV protection',
                              ),
                              const SizedBox(height: 24),
                              const Text(
                                'Earlier',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Color(0xFF838BAA),
                                ),
                              ),
                              const SizedBox(height: 16),
                              _buildNotificationItem(
                                isNew: false,
                                icon: 'assets/icons/ic-wind.svg',
                                time: '1 day ago',
                                message:
                                    'A cloudy day will occur all day long, don\'t worry about the heat of the sun',
                              ),
                              const SizedBox(height: 16),
                              _buildNotificationItem(
                                isNew: false,
                                icon: 'assets/icons/ic-rain.svg',
                                time: '2 days ago',
                                message:
                                    'Potential for rain today is 84%, don\'t forget to bring your umbrella.',
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
            child: Badge(
              smallSize: 8,
              child: SvgPicture.asset("assets/icons/ic-notification.svg"),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWeatherImage() {
    if (controller.dataWeather.value == null) {
      return const SizedBox(height: 120);
    }

    return Image.asset(
      WeatherUtils.getLargeIconAsset(
          controller.dataWeather.value?.values['weatherCode'] ?? 0),
      width: 120,
      fit: BoxFit.cover,
      errorBuilder: (context, error, stackTrace) {
        return Container(
          width: 120,
          height: 120,
          color: Colors.white.withOpacity(0.3),
          child: const Icon(Icons.image_not_supported, color: Colors.white),
        );
      },
    );
  }

  Widget _buildWeatherCard() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 32),
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.35),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: Colors.white.withOpacity(0.3),
          width: 1.5,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Column(
        children: [
          Align(
            alignment: Alignment.center,
            child: Text(
              "Today, ${DateFormat('dd MMMM').format(DateTime.now())}",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w500,
                shadows: [
                  Shadow(
                    color: Colors.black.withOpacity(0.1),
                    offset: Offset(-2, 3),
                    blurRadius: 1,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 12),
          Text(
            "${controller.dataWeather.value?.values['temperature'] ?? ''}°",
            style: TextStyle(
              color: Colors.white,
              fontSize: 100,
              shadows: [
                Shadow(
                  color: Colors.black.withOpacity(0.2),
                  offset: Offset(-4, 8),
                  blurRadius: 50,
                ),
                Shadow(
                  color: Colors.white.withOpacity(0.1),
                  offset: Offset(-4, 2),
                  blurRadius: 5,
                ),
                Shadow(
                  color: Colors.black.withOpacity(0.25),
                  offset: Offset(2, -3),
                  blurRadius: 6,
                ),
              ],
            ),
          ),
          Text(
            WeatherUtils.getCondition(
                controller.dataWeather.value?.values['weatherCode'] ?? 0),
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w500,
              shadows: [
                Shadow(
                  color: Colors.black.withOpacity(0.1),
                  offset: Offset(-2, 3),
                  blurRadius: 1,
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 16,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.03),
                          offset: Offset(1, 1),
                          blurRadius: 5,
                        ),
                      ],
                    ),
                    child: SvgPicture.asset(
                      "assets/icons/ic-wind.svg",
                      color: Colors.white,
                      width: 22,
                    ),
                  ),
                  const SizedBox(height: 22.0),
                  Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.03),
                          offset: Offset(1, 1),
                          blurRadius: 5,
                        ),
                      ],
                    ),
                    child: SvgPicture.asset(
                      "assets/icons/ic-humidity.svg",
                      color: Colors.white,
                      width: 22,
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Wind",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      shadows: [
                        Shadow(
                          color: Colors.black.withOpacity(0.1),
                          offset: Offset(-2, 3),
                          blurRadius: 1,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  Text(
                    "Hum",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      shadows: [
                        Shadow(
                          color: Colors.black.withOpacity(0.1),
                          offset: Offset(-2, 3),
                          blurRadius: 1,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "|",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  Text(
                    "|",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${controller.dataWeather.value?.values['windSpeed'] ?? ''} kph",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      shadows: [
                        Shadow(
                          color: Colors.black.withOpacity(0.1),
                          offset: Offset(-2, 3),
                          blurRadius: 1,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  Text(
                    "${controller.dataWeather.value?.values['humidity'] ?? ''} %",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      shadows: [
                        Shadow(
                          color: Colors.black.withOpacity(0.1),
                          offset: Offset(-2, 3),
                          blurRadius: 1,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildNotificationItem({
    required String icon,
    required String time,
    required String message,
    required bool isNew,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SvgPicture.asset(
          icon,
          width: 24,
          height: 24,
          color: isNew ? const Color(0xFF2B2B2B) : const Color(0xFF838BAA),
        ),
        const SizedBox(width: 20.0),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                time,
                style: TextStyle(
                  fontSize: 14,
                  color:
                      isNew ? const Color(0xFF2B2B2B) : const Color(0xFF838BAA),
                ),
              ),
              const SizedBox(height: 4),
              Text(
                message,
                style: TextStyle(
                  fontSize: 16,
                  color: isNew ? Color(0xFF2B2B2B) : Color(0xFF838BAA),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 15.0),
      ],
    );
  }

  Widget _buildSearchButton() {
    return IconButton(
      icon: const Icon(
        Icons.keyboard_arrow_down,
        color: Colors.white,
      ),
      onPressed: () async {
        final result = await Get.toNamed(SearchLocationRoutes.searchLocation);
        if (result != null) {
          await controller.fetchWeather(selectedCity: result);
        }
      },
    );
  }
}
