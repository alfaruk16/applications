
import 'package:applications/features/presentation/getx/controllers/login_controller.dart';
import 'package:applications/features/presentation/widgets/widgets.dart';
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
          child: Container(
            padding: const EdgeInsets.all(20),
        alignment: Alignment.center,
        color: Colors.red,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Widgets().textField(
                'User Name',
                TextInputType.emailAddress,
                loginController.emailController,
                loginController.emailFocusNode,
                false),
            const SizedBox(height: 8),
            Widgets().textField(
                'Password',
                TextInputType.visiblePassword,
                loginController.passwordController,
                loginController.passwordFocusNode,
                true),
            const SizedBox(height: 16),
            GestureDetector(
              onTap: (){
                loginController.login();
              },
              child: Widgets().button("Login", Colors.blue),)

          ],
        ),
      )),
    );
  }
}
