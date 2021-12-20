import 'package:applications/features/presentation/getx/controllers/applications_controller.dart';
import 'package:applications/features/presentation/getx/controllers/login_controller.dart';
import 'package:get/get.dart';

class AllBindings extends Bindings{
  @override
  void dependencies() {
    Get.putAsync(() async => LoginController());
    Get.putAsync(() async => ApplicationController());
  }
}