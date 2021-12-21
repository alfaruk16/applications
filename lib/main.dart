
import 'package:applications/features/applications/presentation/getx/controllers/applications_controller.dart';
import 'package:applications/features/applications/presentation/pages/application_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'features/applications/presentation/getx/bindings/bindings.dart';
import 'features/applications/presentation/pages/login_page.dart';
import 'package:get_storage/get_storage.dart';

Future<void> main() async {
  await GetStorage.init();
  AllBindings().dependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: Get.find<ApplicationController>().checkLocalDatabase() ? ApplicationPage(): LoginPage(),
    );
  }
}
