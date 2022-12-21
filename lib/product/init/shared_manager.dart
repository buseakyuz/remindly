import 'package:shared_preferences/shared_preferences.dart';

class SharedManager {
  static SharedManager? _instace;
  static SharedManager get instance {
    _instace ??= SharedManager._init();
    return _instace!;
  }

  SharedManager._init();

  late SharedPreferences prefences;

  Future<void> initSharedManager() async {
    prefences = await SharedPreferences.getInstance();
  }

  int? getIntValue(SharedKeys key) {
    return prefences.getInt(key.toString());
  }

  Future<bool> setIntValue(SharedKeys key, int value) async {
    return await prefences.setInt(key.toString(), value);
  }

  bool getBoolValue(SharedKeys key) {
    return prefences.getBool(key.toString()) ?? false;
  }

  Future<bool> setBoolValue(SharedKeys key, bool value) async {
    return await prefences.setBool(key.toString(), value);
  }
}

enum SharedKeys { theme, onBoard }
