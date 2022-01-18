import 'package:covid/city.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'constansts.dart';

class States extends StatefulWidget {
  @override
  _StatesState createState() => _StatesState();
}

class _StatesState extends State<States> {
  String selectedState = '';
  @override
  Widget build(BuildContext context) {
    List<String> state = [
      'Andaman and Nicobar Islands',
      'Andhra Pradesh',
      'Arunachal Pradesh',
      'Assam',
      'Bihar',
      'Chhattisgarh',
      'Chandigarh',
      'Delhi',
      'Dadra and Nagar Haveli and Daman and Diu',
      'Goa',
      'Gujarat',
      'Himachal Pradesh',
      'Haryana',
      'Jharkhand',
      'Jammu and Kashmir',
      'Karnataka',
      'Kerala',
      'Ladakh',
      'Lakshadweep',
      'Maharashtra',
      'Meghalaya',
      'Manipur',
      'Madhya Pradesh',
      'Mizoram',
      'Nagaland',
      'Odisha',
      'Punjab',
      'Puducherry',
      'Rajasthan',
      'Sikkim',
      'Telangana',
      'Tamil Nadu',
      'Uttar Pradesh',
      'Uttarakhand',
      'West Bengal',
    ];
    return Scaffold(
      backgroundColor: kbackgroundColor,
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Choose your State',
          style: TextStyle(fontSize: 20),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Scrollbar(
          isAlwaysShown: true,
          child: ListView.separated(
            padding: const EdgeInsets.all(8),
            itemCount: state.length,
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                onTap: () async {
                  selectedState = state[index];
                  SharedPreferences pref =
                      await SharedPreferences.getInstance();
                  pref.setString('SelectedState', selectedState);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Cities()),
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(0xff2666FB)),
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                  child: Center(
                      child: Text(
                    state[index],
                    style: TextStyle(fontSize: 20),
                  )),
                ),
              );
            },
            separatorBuilder: (BuildContext context, int index) =>
                const Divider(),
          ),
        ),
      ),
    );
  }
}
