
import 'package:applications/features/applications/data/models/login.dart';
import 'package:applications/features/applications/domain/entities/access_data.dart';
import 'package:applications/features/applications/domain/entities/applications.dart';
import 'package:applications/features/applications/domain/entities/remote_data_non_field.dart';
import 'package:applications/features/applications/presentation/getx/controllers/applications_controller.dart';
import 'package:applications/features/applications/presentation/getx/controllers/login_controller.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';

import 'api_services.dart';

class ApiResponse{

  final loginController = Get.find<LoginController>();
  final applicationController = Get.find<ApplicationController>();

  Future<Applications> loginApi(Login login) async {
    var applications = Applications();
    loginController.isLoading(true);
    var response = await ApiServices().login(login.toJson());
    if (response.statusCode == 200) {
      var user = AccessData.fromJson(response.body);
      applications = await callApplicationList(user.token);
    } else {
      var nonField = NonFieldError.fromJson(response.body);
      Fluttertoast.showToast(msg: nonField.nonFieldErrors![0]);
      loginController.isLoading(false);
    }
    return applications;
  }

  Future<Applications> callApplicationList(String? token) async {
    var applications = Applications();
    var response = await ApiServices().applicationList(token);
    if (response.statusCode == 200) {
      applications = Applications.fromJson(response.body);
    }
    loginController.isLoading(false);
    return applications;
  }
}