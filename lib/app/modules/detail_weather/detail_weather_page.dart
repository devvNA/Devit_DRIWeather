import 'package:devit_driweather/app/core/helpers/weather_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'detail_weather_controller.dart';

class DetailWeatherPage extends GetView<DetailWeatherController> {
  const DetailWeatherPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        return Stack(
          children: [
            Image.asset(
              height: Get.height,
              width: Get.width,
              "assets/images/home-bg.png",
              fit: BoxFit.cover,
            ),
            SafeArea(
              child: Padding(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        IconButton(
                          icon: Icon(Icons.arrow_back_ios_new,
                              color: Colors.white),
                          onPressed: () => Get.back(),
                        ),
                        Text(
                          'Back',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
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
                    SizedBox(height: 24.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Today',
                          style: TextStyle(
                            fontSize: 32,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            shadows: [
                              Shadow(
                                color: Colors.black.withOpacity(0.1),
                                offset: Offset(-2, 3),
                                blurRadius: 1,
                              ),
                            ],
                          ),
                        ),
                        Text(
                          DateFormat('MMM, dd').format(DateTime.now()),
                          style: TextStyle(
                            fontSize: 20,
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
                      ],
                    ),
                    SizedBox(height: 10),
                    if (controller.isLoading.value)
                      Center(
                        child: CircularProgressIndicator(
                          color: Colors.white,
                        ),
                      ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: List.generate(
                          controller.weatherHourly.length > 5
                              ? 5
                              : controller.weatherHourly.length, (index) {
                        return Expanded(
                          child: InkWell(
                            onTap: () => controller.setIndex(index),
                            child: Obx(() {
                              return Container(
                                padding: EdgeInsets.all(8.0),
                                decoration: BoxDecoration(
                                  border: index == controller.index.value
                                      ? Border.all(
                                          color: Colors.white.withOpacity(0.3),
                                          width: 1.5,
                                        )
                                      : null,
                                  borderRadius: BorderRadius.circular(15),
                                  color: index == controller.index.value
                                      ? Colors.white.withOpacity(0.2)
                                      : null,
                                ),
                                child: Column(
                                  children: [
                                    Text(
                                      '${controller.weatherHourly[index]['values']['temperature']}°C',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                        shadows: [
                                          Shadow(
                                            color:
                                                Colors.black.withOpacity(0.1),
                                            offset: Offset(-2, 3),
                                            blurRadius: 1,
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 24.0),
                                    Image.asset(
                                      WeatherUtils.getLargeIconAsset(
                                        controller.weatherHourly[index]
                                                ['values']['weatherCode'] ??
                                            0,
                                      ),
                                      height: 30,
                                    ),
                                    SizedBox(height: 24.0),
                                    Text(
                                      '${DateFormat('HH').format(DateTime.now().subtract(Duration(hours: 2 - index)))}.00',
                                      style: TextStyle(
                                        color: Colors.white,
                                        shadows: [
                                          Shadow(
                                            color:
                                                Colors.black.withOpacity(0.1),
                                            offset: Offset(-2, 3),
                                            blurRadius: 1,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }),
                          ),
                        );
                      }),
                    ),
                    SizedBox(height: 30),
                    Text(
                      'Next Forecast',
                      style: TextStyle(
                        fontSize: 32,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        shadows: [
                          Shadow(
                            color: Colors.black.withOpacity(0.1),
                            offset: Offset(-2, 3),
                            blurRadius: 1,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 12.0),
                    if (controller.isLoading.value)
                      Center(
                        child: CircularProgressIndicator(
                          color: Colors.white,
                        ),
                      ),
                    Expanded(
                      child: Scrollbar(
                        thumbVisibility: true,
                        trackVisibility: true,
                        interactive: true,
                        child: Padding(
                          padding: EdgeInsets.only(right: 12.0),
                          child: ListView.builder(
                            padding: EdgeInsets.symmetric(horizontal: 8.0),
                            itemCount: controller.weatherDaily.length > 10
                                ? 10
                                : controller.weatherDaily.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: EdgeInsets.only(
                                  right: 12.0,
                                  bottom: 12.0,
                                  top: 12,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      DateFormat('MMM, dd').format(
                                          DateTime.parse(controller
                                              .weatherDaily[index]['time'])),
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        shadows: [
                                          Shadow(
                                            color:
                                                Colors.black.withOpacity(0.1),
                                            offset: Offset(-2, 3),
                                            blurRadius: 1,
                                          ),
                                        ],
                                      ),
                                    ),
                                    Image.asset(
                                      WeatherUtils.getLargeIconAsset(controller
                                                  .weatherDaily[index]['values']
                                              ['weatherCodeMax'] ??
                                          0),
                                      width: 35,
                                      height: 35,
                                    ),
                                    Text(
                                      '${controller.weatherDaily[index]['values']['temperatureAvg']}°',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        shadows: [
                                          Shadow(
                                            color:
                                                Colors.black.withOpacity(0.1),
                                            offset: Offset(-2, 3),
                                            blurRadius: 1,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          "assets/icons/ic-sun.svg",
                          color: Colors.white,
                        ),
                        SizedBox(width: 12.0),
                        Text(
                          'DRI Weather',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            shadows: [
                              Shadow(
                                color: Colors.white.withOpacity(0.25),
                                offset: Offset(-1, 1),
                                blurRadius: 2,
                              ),
                              Shadow(
                                color: Colors.black.withOpacity(0.10),
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
              ),
            ),
          ],
        );
      }),
    );
  }
}
