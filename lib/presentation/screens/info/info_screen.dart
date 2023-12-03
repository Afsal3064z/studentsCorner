import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studentsapp/presentation/screens/info/info_controller.dart';

class InfoPage extends StatelessWidget {
  const InfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Obx(() => Text(
              "This will be the info page of the web app, Additional State: ${infoController.additionalState}",
              style: const TextStyle(fontSize: 18),
            )),
      ),
    );
  }
}
