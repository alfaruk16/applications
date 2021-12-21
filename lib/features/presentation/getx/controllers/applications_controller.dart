import 'package:applications/features/data/datasources/local_database.dart';
import 'package:device_apps/device_apps.dart';
import 'package:applications/features/data/datasources/api_services.dart';
import 'package:applications/features/domain/entities/applications.dart';
import 'package:applications/features/presentation/pages/application_page.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:url_launcher/url_launcher.dart';

class ApplicationController extends GetxController {
  var applications = Applications().obs;
  final box = GetStorage();

  Future<void> callApplicationList(String? token) async {
    var response = await ApiServices().applicationList(token);
    if (response.statusCode == 200) {
      applications.value = Applications.fromJson(response.body);
      await box.write(LocalDatabase().applications, response.body);
      Get.to(ApplicationPage());
    }
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

  bool checkLocalDatabase() {
    if (box.read(LocalDatabase().applications) != null) {
      applications.value =
          Applications.fromJson(box.read(LocalDatabase().applications));
      return true;
    }
    return false;
  }
}
