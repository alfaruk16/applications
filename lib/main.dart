
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'features/presentation/getx/bindings/bindings.dart';
import 'features/presentation/pages/login_page.dart';

void main() {
  AllBindings().dependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}
