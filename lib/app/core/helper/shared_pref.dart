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
  static SharedPreferences? _preferences;

  static Future<void> init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  /// Menyimpan String
  static Future<bool> setString(String key, String value) async {
    if (_preferences == null) return false;
    return await _preferences!.setString(key, value);
  }

  /// Menyimpan Integer
  static Future<bool> setInt(String key, int value) async {
    if (_preferences == null) return false;
    return await _preferences!.setInt(key, value);
  }

  /// Menyimpan Double
  static Future<bool> setDouble(String key, double value) async {
    if (_preferences == null) return false;
    return await _preferences!.setDouble(key, value);
  }

  /// Menyimpan Boolean
  static Future<bool> setBool(String key, bool value) async {
    if (_preferences == null) return false;
    return await _preferences!.setBool(key, value);
  }

  /// Menyimpan List of Strings
  static Future<bool> setStringList(String key, List<String> value) async {
    if (_preferences == null) return false;
    return await _preferences!.setStringList(key, value);
  }

  // --- Metode untuk Mengambil Data ---

  /// Mengambil String
  static String? getString(String key) {
    if (_preferences == null) return null;
    return _preferences!.getString(key);
  }

  /// Mengambil Integer
  static int? getInt(String key) {
    if (_preferences == null) return null;
    return _preferences!.getInt(key);
  }

  /// Mengambil Double
  static double? getDouble(String key) {
    if (_preferences == null) return null;
    return _preferences!.getDouble(key);
  }

  /// Mengambil Boolean
  static bool? getBool(String key) {
    if (_preferences == null) return null;
    return _preferences!.getBool(key);
  }

  /// Mengambil List of Strings
  static List<String>? getStringList(String key) {
    if (_preferences == null) return null;
    return _preferences!.getStringList(key);
  }

  // --- Metode Lainnya ---

  /// Memeriksa apakah kunci ada
  static bool containsKey(String key) {
    if (_preferences == null) return false;
    return _preferences!.containsKey(key);
  }

  /// Menghapus data berdasarkan kunci
  static Future<bool> remove(String key) async {
    if (_preferences == null) return false;
    return await _preferences!.remove(key);
  }

  /// Menghapus semua data
  static Future<bool> clear() async {
    if (_preferences == null) return false;
    return await _preferences!.clear();
  }
}
