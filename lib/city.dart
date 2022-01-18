import 'package:covid/ResultScreen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'cityClass.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'constansts.dart';

enum cityEnum { is_empty, not_empty }

class Cities extends StatefulWidget {
  Cities({this.selectedstate});
  final String selectedstate;
  @override
  _CitiesState createState() => _CitiesState();
}

List<String> City = [];
String Finalstate = '';
String selectedCity = '';

class _CitiesState extends State<Cities> {
  final currentState =
      City.length == 0 ? cityEnum.is_empty : cityEnum.not_empty;

  getDataCity() async {
    print('I got executed first');
    SharedPreferences pref = await SharedPreferences.getInstance();
    String state1 = pref.getString('SelectedState');
    print('Value of state: $state1');
    setState(() {
      Finalstate = state1;
    });
    dynamic cityData = await CityData.getCities(Finalstate);
    setState(() {
      City = cityData;
    });
  }

  @override
  void initState() {
    getDataCity();
    super.initState();
  }

  Empty_Screen(context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Center(
        child: LottieBuilder.network(
            'https://assets6.lottiefiles.com/datafiles/bEYvzB8QfV3EM9a/data.json'),
      ),
    );
  }

  Non_Empty_Screen(context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Scrollbar(
        isAlwaysShown: true,
        child: ListView.separated(
          padding: const EdgeInsets.all(8),
          itemCount: City.length,
          itemBuilder: (BuildContext context, int index) {
            return InkWell(
              onTap: () async {
                selectedCity = City[index];
                SharedPreferences prefs = await SharedPreferences.getInstance();
                prefs.setString('SelectedCity', selectedCity);

                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Resultscreen()),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0xff2666FB)),
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                child: Center(
                    child: Text(
                  City[index],
                  style: TextStyle(fontSize: 20),
                )),
              ),
            );
          },
          separatorBuilder: (BuildContext context, int index) =>
              const Divider(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kbackgroundColor,
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          elevation: 0,
          title: Text(
            'Choose your Region',
            style: TextStyle(fontSize: 20),
          ),
          centerTitle: true,
        ),
        body: City.length == 0
            ? Empty_Screen(context)
            : Non_Empty_Screen(context));
  }
}
