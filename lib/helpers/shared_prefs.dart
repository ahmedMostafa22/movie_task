import 'package:alpha/constants/shared_prefs_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {
  static Future<DateTime> getLastUpdate() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return DateTime.fromMillisecondsSinceEpoch(
        pref.getInt(SharedPreferencesConstants.lastUpdateKey) ?? 0);
  }

  static Future<void> setLastUpdate(DateTime lastUpdate) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setInt(SharedPreferencesConstants.lastUpdateKey,
        lastUpdate.millisecondsSinceEpoch);
  }
}
