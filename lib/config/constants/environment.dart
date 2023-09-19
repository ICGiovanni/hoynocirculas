import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {
  static Future<void> loadEnv() async {
    await dotenv.load(fileName: ".env");
  }

  static String apiUrl =
      dotenv.env['API_URL'] ?? 'No esta configurado el API_URL';

  static String firebaseApiKey = dotenv.env['FIREBASE_API_KEY'] ??
      'No esta configurado el FIREBASE_API_KEY';

  static String apiKeyGoogleMaps = dotenv.env['API_SDK_GOOGLE_MAPS_ANDROID'] ??
      'No esta configurado el API_SDK_GOOGLE_MAPS_ANDROID';

  static String countryCodeLatitud = dotenv.env['COUNTRY_CODE_LATITUD'] ??
      'No esta configurado el COUNTRY_CODE_LATITUD';

  static String countryCodeLongitud = dotenv.env['COUNTRY_CODE_LONGITUD'] ??
      'No esta configurado el COUNTRY_CODE_LONGITUD';
}
