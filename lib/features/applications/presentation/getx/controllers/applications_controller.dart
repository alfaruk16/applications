import 'package:applications/features/applications/data/datasources/local_database.dart';
import 'package:applications/features/applications/domain/entities/applications.dart';
import 'package:applications/features/applications/domain/repositories/applications_repository.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ApplicationController extends GetxController {
  var applications = Applications().obs;
  final box = GetStorage();

  applicationItemClicked(UserData userData){
    ApplicationRepository().applicationItemClicked(userData);
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
