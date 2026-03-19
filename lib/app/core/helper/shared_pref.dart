/*
 * Created by Vinsensius Arko on 17/03/2025, 12:51
 * vinsensiusarka@gmail.com
 * Last modified 25/12/2024, 20:54
 * Copyright (c) 2025.
 * All rights reserved.
 */

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesManager extends GetxService {
  late SharedPreferences sharedPreferences;

  /// Fungsi inisialisasi async
  Future<SharedPreferencesManager> init() async {
    sharedPreferences = await SharedPreferences.getInstance();
    return this;
  }

  /// --- Helper Methods ---
  Future<bool> putBool(String key, bool value) => sharedPreferences.setBool(key, value);
  bool getBool(String key) => sharedPreferences.getBool(key) ?? false;

  Future<bool> putDouble(String key, double value) => sharedPreferences.setDouble(key, value);
  double? getDouble(String key) => sharedPreferences.getDouble(key);

  Future<bool> putInt(String key, int value) => sharedPreferences.setInt(key, value);
  int? getInt(String key) => sharedPreferences.getInt(key);

  Future<bool> putString(String key, String value) => sharedPreferences.setString(key, value);
  String? getString(String key) => sharedPreferences.getString(key);

  Future<bool> putStringList(String key, List<String> value) => sharedPreferences.setStringList(key, value);
  List<String>? getStringList(String key) => sharedPreferences.getStringList(key);

  bool isKeyExists(String key) => sharedPreferences.containsKey(key);
  Future<bool> clearKey(String key) => sharedPreferences.remove(key);
  Future<bool> clearAll() => sharedPreferences.clear();
}
