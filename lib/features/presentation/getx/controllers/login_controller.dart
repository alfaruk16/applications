
import 'package:applications/core/entities/remote_data_non_field.dart';
import 'package:applications/core/error/text_field_info.dart';
import 'package:applications/core/network/network_info.dart';
import 'package:applications/features/data/datasources/api_services.dart';
import 'package:applications/features/data/models/login.dart';
import 'package:applications/features/domain/entities/access_data.dart';
import 'package:applications/features/presentation/getx/controllers/applications_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginController extends GetxController {
  final userNameController = TextEditingController();
  final passwordController = TextEditingController();

  final userNameFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();

  var userNameRequired = false.obs;
  var passwordRequired = false.obs;

  var isLoading = false.obs;

  login() async {
    if (await NetworkInfo().connected()) {
      if (!TextFieldInfo().checkTextField(userNameController.text)) {
        userNameRequired(true);
      } else if (!TextFieldInfo().checkTextField(passwordController.text)) {
        passwordRequired(true);
      } else {
        isLoading(true);
        FocusScope.of(Get.context!).requestFocus(FocusNode());
        var login = Login();
        login.username = userNameController.text;
        login.password = passwordController.text;

        var response = await ApiServices().login(login.toJson());
        if (response.statusCode == 200) {
          var user = AccessData.fromJson(response.body);
          Get.find<ApplicationController>().callApplicationList(user.token);
        } else {
          var nonField = NonFieldError.fromJson(response.body);
          Fluttertoast.showToast(msg: nonField.nonFieldErrors![0]);
        }
        isLoading(false);
      }
    } else {
      Fluttertoast.showToast(msg: "No Internet Connection");
    }
  }

  void checkTextField(TextEditingController controller) {
    if (controller == userNameController) {
      userNameRequired(false);
    } else if (controller == passwordController) {
      passwordRequired(false);
    }
  }
}
