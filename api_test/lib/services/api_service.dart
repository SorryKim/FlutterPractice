import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl =
      'https://apis.vworld.kr/2ddata/frstclimb/data?apiKey=FD8BE812-DB52-328F-828B-712A51614E8A&output=json&emdCd=11620103&srsName=EPSG:3857';

  void getMountain() async {
    final url = Uri.parse(baseUrl);
    final response = await http.get(url);

    if (response.statusCode == 200) {
      print(response.body);
    }
  }
}
