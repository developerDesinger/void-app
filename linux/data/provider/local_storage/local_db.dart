import 'dart:convert';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:voidapp/app/config/global_var.dart';
import 'package:voidapp/app/config/local_keys.dart';

// import '../../../app/config/global_var.dart';
// import '../../../app/config/local_keys.dart';

class LocalDB extends GetxService {
  late SharedPreferences pref;

  Future<LocalDB> init() async {
    pref = await SharedPreferences.getInstance();
    Get.log("LocalDB Controller init called : Service Started");
    Globals.authToken = pref.getString(LocalDataKey.authToken.name) ?? "";
    if (Globals.email != null && Globals.email!.isEmpty) {
      Globals.email = null;
    }
    return this;
  }

  static Future setData(String key, value) async {
    SharedPreferences pref = Get.find<LocalDB>().pref;
    if (value is Map<String, dynamic>) {
      await pref.setString(key, jsonEncode(value)); // Convert to JSON string
      return;
    }
    switch (value.runtimeType) {
      case int:
        await pref.setInt(key, value);
        break;
      case String:
        await pref.setString(key, value);
        break;
      case bool:
        await pref.setBool(key, value);
        break;
      case double:
        await pref.setDouble(key, value);
        break;
    }
  }

  static Future<dynamic> getData(String key, {Type? type}) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    if (type == Map) {
      String? jsonString = pref.getString(key);
      return jsonDecode(jsonString!) as Map<String, dynamic>;
    } else if (type == List) {
      return pref.getStringList(key);
    } else {
      return pref.get(key);
    }
  }

  static void clear() async {
    SharedPreferences pref = Get.find<LocalDB>().pref;
    bool first = pref.getBool("first") ?? false;
    Globals.fcmToken = "";
    Globals.authToken = "";
    pref.remove("auth_token");
    pref.remove("user_data");
    await pref.clear();
    if (first) {
      // pref.setBool("first", Globals.firsTime);
    }
  }
}
