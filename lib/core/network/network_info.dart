import 'dart:async';

import 'package:connectivity/connectivity.dart';

class NetworkInfo {
  Future<bool> connected() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
    } else if (connectivityResult == ConnectivityResult.wifi) {
    } else {
      return false;
    }
    return true;
  }
}
