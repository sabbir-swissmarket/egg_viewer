import 'package:epg_viewer/utils/core.dart';
import 'package:flutter/material.dart';

class SharedPrefManager {
  Future<void> saveStringValue(String keyName, String data) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(keyName, data);
    debugPrint("$keyName is stored");
  }

  Future<void> saveIntValue(String keyName, int data) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt(keyName, data);
    debugPrint("$keyName is stored");
  }

  Future<String?> getStringValue(String keyValue) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? stringValue = prefs.getString(keyValue);
    return stringValue;
  }

  Future<int?> getIntValue(String keyValue) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int? intValue = prefs.getInt(keyValue);
    return intValue;
  }

  Future<bool> isKeyValid(String keyValue) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool checkValue = prefs.containsKey(keyValue);
    return checkValue;
  }

  Future<void> removeAValue(String keyValue) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    debugPrint("$keyValue is removed");
    prefs.remove(keyValue);
  }

  Future<void> erase() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }
}
