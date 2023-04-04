import "dart:convert";

import "package:api_test/models/route.dart";
import "package:http/http.dart" as http;

class ApiService {
  static const String baseUrl = '';
  static const String today = "today";

  static Future<List<RouteModel>> getRoute() async {
    List<RouteModel> routeInstances = [];
    final url = Uri.parse(baseUrl);
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List<dynamic> routes = jsonDecode(response.body);

      for (var route in routes) {
        routeInstances.add(RouteModel.fromJson(route));
      }

      return routeInstances;
    }

    throw Error();
  }
}
