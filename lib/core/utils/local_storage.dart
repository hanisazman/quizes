import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  static SharedPreferences? _preferences;

  LocalStorage._();

  static LocalStorage? _localStorage;

  static LocalStorage instance = LocalStorage._();

  static Future<LocalStorage> getInstance() async {
    if (_localStorage == null) {
      _localStorage = LocalStorage._();
      await _localStorage!._init();
    }
    return _localStorage!;
  }

  static Future<SharedPreferences> getSharedPreferences() async {
    if (_preferences == null) {
      _localStorage = LocalStorage._();
      await _localStorage!._init();
    }
    return _preferences!;
  }

  Future<void> _init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  Future<void> setName(String? name) async {
    if (_preferences != null) {
      await _preferences!.setString("name", name ?? '');
    }
  }

  String getName() => _preferences?.getString("name") ?? '';

  void deleteName() => _preferences?.remove("name");

  Future<void> setUserName(String? username) async {
    if (_preferences != null) {
      await _preferences!.setString("username", username ?? '');
    }
  }

  String getUserName() => _preferences?.getString("username") ?? '';

  void deleteUserName() => _preferences?.remove("username");

  Future<void> setEmail(String? email) async {
    if (_preferences != null) {
      await _preferences!.setString("email", email ?? '');
    }
  }

  String getEmail() => _preferences?.getString("email") ?? '';

  void deleteEmail() => _preferences?.remove("email");

  Future<void> setIsLogged(bool logged) async {
    if (_preferences != null) {
      await _preferences!.setBool("isLoggedIn", logged);
    }
  }

  bool getIsLoggedIn() => _preferences?.getBool("isLoggedIn") ?? true;
  void deleteIsLoggedIn() => _preferences?.remove("isLoggedIn");

  void clearStore() {
    deleteName();
    deleteUserName();
    deleteEmail();
    deleteIsLoggedIn();
  }
}
