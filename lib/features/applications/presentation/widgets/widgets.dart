import 'package:applications/features/applications/presentation/getx/controllers/login_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Widgets {

  final loginController = Get.find<LoginController>();

  Widget textField(String label, TextInputType inputType,
      TextEditingController controller, FocusNode focusNode, bool obSecure) {
    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.black12)),
        child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            child: TextField(
                onChanged: (text) {
                  loginController.checkTextField(controller);
                },
                controller: controller,
                keyboardType: inputType,
                obscureText: obSecure,
                focusNode: focusNode,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    labelText: label,
                    labelStyle: const TextStyle(color: Colors.black54),
                    fillColor: const Color.fromRGBO(246, 246, 246, 1),
                    filled: true,
                    contentPadding: const EdgeInsets.only(
                        left: 16, right: 16, top: 10, bottom: 10)))));
  }

  Widget button(String text, Color color) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(30.0),
        child: Container(
          color: color,
          padding:
              const EdgeInsets.only(top: 12, bottom: 12, left: 40, right: 40),
          child: Text(
            text,
            style: const TextStyle(
                fontSize: 22, color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ));
  }

  Widget text(String text, Color color, double fontSize) {
    return Text(
      text,
      style: TextStyle(color: color, fontSize: fontSize),
    );
  }

  Widget loader() {
    return Container(
        height: Get.height,
        width: Get.width,
        color: Colors.black54,
        child: const Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
            )));
  }
}
