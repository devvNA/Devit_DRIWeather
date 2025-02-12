import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'notification_controller.dart';

class NotificationPage extends GetView<NotificationController> {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('NotificationPage'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'NotificationPage is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
