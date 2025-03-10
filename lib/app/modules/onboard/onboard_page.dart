import 'package:devit_driweather/app/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'onboard_controller.dart';

class OnboardPage extends GetView<OnboardController> {
  const OnboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            Image.asset("assets/images/onboard-bg.png", fit: BoxFit.cover),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: MediaQuery.sizeOf(context).height * 0.42),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InkWell(
                          onTap: () {
                            controller.locationPermission();
                          },
                          child: const Text(
                            'Never get caught\nin the rain again',
                            style: TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF494A4B),
                            ),
                          ),
                        ),
                        const SizedBox(height: 12),
                        const Text(
                          'Stay ahead of the weather with our accurate forecasts',
                          style: TextStyle(
                            fontSize: 16,
                            color: Color(0xFF494A4B),
                          ),
                        ),
                        const SizedBox(height: 24),
                        Row(
                          children: [
                            Expanded(
                              child: CustomButton(
                                title: 'Get Started',
                                onTap: () {
                                  controller.locationPermission();
                                },
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
