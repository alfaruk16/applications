
import 'package:applications/features/data/models/login.dart';
import 'package:applications/features/domain/entities/access_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../data/datasources/api_services.dart';
import 'applications_controller.dart';

class LoginController extends GetxController{

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final emailFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();

  login() async {
    var login = Login();
    login.username = emailController.text;
    login.password = passwordController.text;

    var response = await ApiServices().login(login.toJson());
    if (response.statusCode == 200) {
      var user = AccessData.fromJson(response.body);
      Get.find<ApplicationController>().callApplicationList(user.token);
    }
  }
}