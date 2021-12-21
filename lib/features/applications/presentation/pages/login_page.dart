import 'package:applications/features/applications/presentation/getx/controllers/login_controller.dart';
import 'package:applications/features/applications/presentation/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  final loginController = Get.find<LoginController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Stack(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            alignment: Alignment.center,
            color: Colors.red,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Widgets().textField(
                    'User Name',
                    TextInputType.emailAddress,
                    loginController.userNameController,
                    loginController.userNameFocusNode,
                    false),
                Obx(() => loginController.userNameRequired.value
                    ? Widgets().text("User Name Required", Colors.white, 14)
                    : const SizedBox(
                        height: 0,
                      )),
                const SizedBox(height: 8),
                Widgets().textField(
                    'Password',
                    TextInputType.visiblePassword,
                    loginController.passwordController,
                    loginController.passwordFocusNode,
                    true),
                Obx(() => loginController.passwordRequired.value
                    ? Widgets().text("Password Required", Colors.white, 14)
                    : const SizedBox(
                        height: 0,
                      )),
                const SizedBox(height: 16),
                GestureDetector(
                    onTap: () {
                      loginController.login();
                    },
                    child: Container(
                      alignment: Alignment.center,
                      child: Widgets().button("Login", Colors.blue),
                    ))
              ],
            ),
          ),
          Obx(() => loginController.isLoading.value
              ? Widgets().loader()
              : const SizedBox(
            height: 0,
          )),
        ],
      )),
    );
  }
}
