import 'package:http/http.dart' as http;
import 'dart:convert';

class CityData {
  static getCities(state) async {
    http.Response response =
        await http.get('https://api.covid19india.org/state_district_wise.json');
    Map data = jsonDecode(response.body);
    List city = data[state]['districtData'].keys.toList();
    return city;
  }
}
