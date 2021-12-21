import 'package:get/get.dart';

class ApiServices extends GetConnect{
  final String baseURL = "http://heal.dev.mpower-social.com/";

  Future<Response> login(Map data) => post(baseURL+"api/login/", data);
  Future<Response> applicationList(String? token) => super.post(baseURL+"api/mobile/application_list/","", headers: {"Authorization": "JWT $token"});
}