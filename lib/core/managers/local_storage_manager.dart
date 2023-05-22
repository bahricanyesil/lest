import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  factory LocalStorage() {
    return _instance;
  }

  LocalStorage._internal();
  static final LocalStorage _instance = LocalStorage._internal();

  late SharedPreferences _preferences;

  Future<void> initialize() async {
    _preferences = await SharedPreferences.getInstance();
  }

  Future<bool> containsKey(String key) async {
    return _preferences.containsKey(key);
  }

  T? getValue<T>(String key) {
    final val = _preferences.get(key);
    if (T == DateTime && val is String) {
      return DateTime.tryParse(val) as T?;
    }
    if (val is T) return val;
    return null;
  }

  dynamic getUntypedValue(String key) {
    return _preferences.get(key);
  }

  Future<bool> setValue<T>(String key, T value) async {
    if (value is bool) {
      return _preferences.setBool(key, value);
    } else if (value is int) {
      return _preferences.setInt(key, value);
    } else if (value is double) {
      return _preferences.setDouble(key, value);
    } else if (value is String) {
      return _preferences.setString(key, value);
    } else if (value is List<String>) {
      return _preferences.setStringList(key, value);
    } else {
      throw Exception('Unsupported value type');
    }
  }

  Future<bool> removeValue(String key) async {
    return _preferences.remove(key);
  }

  Future<bool> clear() async {
    return _preferences.clear();
  }
}
