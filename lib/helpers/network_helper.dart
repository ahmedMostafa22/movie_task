import 'package:alpha/constants/api_keys.dart';
import 'package:alpha/constants/network_consts.dart';

class NetworkHelper {
  Map<String, String> getHeadersWithToken() => {
        'X-RapidAPI-Key': APIKeys.rapidAPIKey,
        'X-RapidAPI-Host': NetworkConstants.rapidAPIHost
      };
}
