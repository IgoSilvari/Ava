 
class Repository {
  const Repository();

  static const basicHeaders = {
    'Accept': 'application/json',
    'Content-Type': 'application/json',
  };

  // static Future<String?>? keyJwt() async {
  //   final storage = SecureStorageHelper();
  //   final key = await storage.getJWT();
  //   return key;
  // }

  static final basicHeadersStandard = {
    'Accept': 'application/json',
    'Content-Type': 'application/json',
  };

  static Map<String, String> headersWithToken(String? jwt) {
    final headers = basicHeadersStandard;
    headers['Authorization'] = 'Bearer $jwt';
    return headers;
  }

  // static void saveToken(String? jwt) {
  //   if (jwt != null) {
  //     final storageHelper = SecureStorageHelper();
  //     storageHelper.saveJWT(jwt);
  //   }
  // }

  }
