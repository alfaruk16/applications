import 'package:device_apps/device_apps.dart';
import 'package:applications/features/data/datasources/api_services.dart';
import 'package:applications/features/domain/entities/applications.dart';
import 'package:applications/features/presentation/pages/application_page.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class ApplicationController extends GetxController {
  var applications = Applications().obs;

  //application api
  Future<void> callApplicationList(String? token) async {
    var response = await ApiServices().applicationList(token);
    if (response.statusCode == 200) {
      applications.value = Applications.fromJson(response.body);
      Get.to(ApplicationPage());
    }
  }

  Future<void> applicationItemClicked(Data data) async {
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
        } catch (e) {}
      }
    }
    print(isInstalled);
    if(!isInstalled){
      launch(data.weblink!);
    }
  }
}
