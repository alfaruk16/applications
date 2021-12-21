
import 'package:applications/core/network/network_info.dart';
import 'package:applications/features/applications/domain/usecases/login.dart';
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
      UserLogin().login(userNameController.text, passwordController.text);
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
