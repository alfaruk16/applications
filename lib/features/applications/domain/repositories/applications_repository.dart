import 'package:applications/features/applications/data/datasources/api_responses.dart';
import 'package:applications/features/applications/data/datasources/local_database.dart';
import 'package:applications/features/applications/data/models/login.dart';
import 'package:applications/features/applications/domain/entities/applications.dart';
import 'package:applications/features/applications/presentation/getx/controllers/applications_controller.dart';
import 'package:applications/features/applications/presentation/getx/controllers/login_controller.dart';
import 'package:applications/features/applications/presentation/pages/application_page.dart';
import 'package:device_apps/device_apps.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class ApplicationRepository {
  final loginController = Get.find<LoginController>();
  final applicationController = Get.find<ApplicationController>();

  Future<void> login(String userName, String password) async {
    FocusScope.of(Get.context!).requestFocus(FocusNode());
    var login = Login();
    login.username = userName;
    login.password = password;

    applicationController.applications.value = await ApiResponse().loginApi(login);
    await applicationController.box.write(LocalDatabase().applications, applicationController.applications.value.toJson());
    Get.to(ApplicationPage());

  }

  Future<void> applicationItemClicked(UserData data) async {
    bool isInstalled = false;
    List<Application> apps = await DeviceApps.getInstalledApplications();
    for (int i = 0; i < apps.length; i++) {
      if (apps[i]
          .appName
          .toLowerCase()
          .startsWith(data.applicantName!.toLowerCase().replaceAll(" ", ""))) {
        try {
          isInstalled = await DeviceApps.isAppInstalled(apps[i].packageName);
          if (isInstalled) {
            DeviceApps.openApp(apps[i].packageName);
          }
        } catch (e) {
          //print(e);
        }
      }
    }
    if (!isInstalled) {
      launch(data.weblink!);
    }
  }

}
