import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StorageRepository {
  static final StorageRepository instance = StorageRepository._();
  static SharedPreferences? _preference;

  StorageRepository._() {
    _init();
  }

  factory StorageRepository() => instance;

  Future<void> _init() async {
    _preference = await SharedPreferences.getInstance();
  }

  static Future<void> setString({
    required String key,
    required String value,
  }) async {
    if (_preference != null) {
      debugPrint("SAVING STRING:$value");
      _preference!.setString(key, value);
    }
  }

  static String getString({required String key}) {
    if (_preference != null) {
      return _preference!.getString(key) ?? "";
    }
    return "";
  }
}
