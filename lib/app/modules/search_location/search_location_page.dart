import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'search_location_controller.dart';

class SearchLocationPage extends GetView<SearchLocationController> {
  const SearchLocationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<SearchLocationController>(builder: (controller) {
        return SafeArea(
          child: Stack(
            children: [
              Align(
                alignment: Alignment.bottomCenter,
                child: Image.asset(
                  'assets/images/image-map.png',
                  width: double.infinity,
                  fit: BoxFit.cover,
                  height: Get.height / 1.5,
                ),
              ),
              GestureDetector(
                onTap: () => controller.searchLocation(' '),
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: Image.asset(
                    "assets/icons/ic-gps.png",
                    width: 120,
                    height: 120,
                  ),
                ),
              ),
              Container(
                height: Get.height * 0.4,
                decoration: BoxDecoration(
                  color: const Color(0xFFFFFFFF),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(32.0),
                    bottomRight: Radius.circular(32.0),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.all(18),
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(32),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.15),
                            offset: const Offset(-4, 8),
                            blurRadius: 50,
                            spreadRadius: 4,
                          ),
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            offset: const Offset(2, -3),
                            blurRadius: 6,
                            spreadRadius: 0,
                          ),
                          BoxShadow(
                            color: Colors.white.withOpacity(0.2),
                            offset: const Offset(-5, 4),
                            blurRadius: 4,
                            spreadRadius: 0,
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          InkWell(
                            onTap: () => Get.back(),
                            child: const Icon(Icons.arrow_back,
                                color: Color(0xFF444E72)),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: TextField(
                              decoration: const InputDecoration(
                                hintText: 'Search here',
                                hintStyle: TextStyle(
                                  color: Color(0xFF444E72),
                                  fontSize: 16,
                                ),
                                border: InputBorder.none,
                              ),
                              onSubmitted: (value) =>
                                  controller.searchLocation(value),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 18, vertical: 8),
                      child: Text(
                        'Recent search',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF444E72),
                        ),
                      ),
                    ),
                    _buildRecentSearchItem('Surabaya'),
                    _buildRecentSearchItem('Jakarta'),
                    _buildRecentSearchItem('Yogyakarta'),
                  ],
                ),
              ),
            ],
          ),
        );
      }),
    );
  }

  Widget _buildRecentSearchItem(String city) {
    return Padding(
      padding: const EdgeInsets.only(left: 16),
      child: ListTile(
        leading: const Icon(
          Icons.access_time,
          color: Color(0xFF444E72),
        ),
        title: Text(
          city,
          style: const TextStyle(
            fontSize: 16,
            color: Color(0xFF444E72),
          ),
        ),
        onTap: () => controller.searchLocation(city),
      ),
    );
  }
}
