import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'constansts.dart';

class CovidData {
  static getData1(region, city) async {
    // pass city and state in this and return a list of data
    List<String> finalResult = [];
    int Active;
    int Recovered;
    int confirmed;
    int deltaConfirmed;
    int deltaDeceased;
    int deltaRecovered;

    http.Response response =
        await http.get('https://api.covid19india.org/state_district_wise.json');
    Map data = jsonDecode(response.body);
    Map state = data[region];
    Map distictdata = state['districtData'];
    Map distict = distictdata[city];
    Map delta = distict['delta'];
    Active = distict['active'];
    Recovered = distict['recovered'];
    confirmed = distict['confirmed'];

    deltaConfirmed = delta['confirmed'];
    deltaDeceased = delta['deceased'];
    deltaRecovered = delta['recovered'];

    finalResult.add(confirmed.toString());
    finalResult.add(Active.toString());
    finalResult.add(Recovered.toString());

    finalResult.add(deltaConfirmed.toString());
    finalResult.add(deltaDeceased.toString());
    finalResult.add(deltaRecovered.toString());
    return finalResult;
  }
}
