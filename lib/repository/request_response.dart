import 'package:http/http.dart' as http;

typedef BodyBuilder = dynamic Function(Map<String, dynamic> json);
typedef ArrayBodyBuilder = dynamic Function(List json);

class RequestResponse<T> {
  RequestResponse(this.allData, this.body);

  final T? body;
  http.Response allData;
  bool get success => statusCode <= 299 && statusCode >= 200;
  bool get internalServerError => statusCode >= 500;
  bool get unauthorized => statusCode == 401;
  int get statusCode => allData.statusCode;

  // static RequestResponse<String> stringBody(http.Response allData) =>
  //     RequestResponse<String>(allData, allData.body);

  // static T? decode<T>(String json, BodyBuilder function) {
  //   try {
  //     final map = const JsonDecoder().convert(json);
  //     return function(map);
  //   } catch (e) {
  //     debugPrint('RequestResponse.decode: $e \n\n response.body:$json');
  //   }
  //   return null;
  // }

  // static T? decodeArray<T>(String json, ArrayBodyBuilder function) {
  //   try {
  //     final map = const JsonDecoder().convert(json);
  //     return function(map);
  //   } catch (e) {
  //     debugPrint('RequestResponse.decode: $e \n\n response.body:$json');
  //   }
  //   return null;
  // }

  // static Map<String, dynamic>? decodeMap(String json) {
  //   try {
  //     final Map<String, dynamic>? map = const JsonDecoder().convert(json);
  //     return map;
  //   } catch (e) {
  //     debugPrint('RequestResponse.decode: $e \n\n response.body:$json');
  //   }
  //   return null;
  // }
}
