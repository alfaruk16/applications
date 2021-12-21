import 'package:applications/features/applications/presentation/getx/controllers/applications_controller.dart';
import 'package:applications/features/applications/presentation/getx/controllers/login_controller.dart';
import 'package:get/get.dart';

class AllBindings extends Bindings{
  @override
  void dependencies() {
    Get.putAsync(() async => LoginController());
    Get.putAsync(() async => ApplicationController());
  }
}