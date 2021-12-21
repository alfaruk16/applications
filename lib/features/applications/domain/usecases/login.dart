
import 'package:applications/core/error/text_field_info.dart';
import 'package:applications/features/applications/domain/repositories/applications_repository.dart';
import 'package:applications/features/applications/presentation/getx/controllers/login_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class UserLogin {
  void login(String userName, String password) {
    final loginController = Get.find<LoginController>();
    if (!TextFieldInfo().checkTextField(userName)) {
      loginController.userNameRequired(true);
      FocusScope.of(Get.context!).requestFocus(loginController.userNameFocusNode);
    } else if (!TextFieldInfo().checkTextField(password)) {
      loginController.passwordRequired(true);
      FocusScope.of(Get.context!).requestFocus(loginController.passwordFocusNode);
    } else {
      ApplicationRepository().login(userName, password);
    }
  }

}
