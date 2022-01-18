import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  static getState() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String state = pref.getString('SelectedState');
    return state;
  }
}
