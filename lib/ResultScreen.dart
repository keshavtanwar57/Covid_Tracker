import 'package:covid/home.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'service.dart';
import 'package:lottie/lottie.dart';
import 'package:google_fonts/google_fonts.dart';
import 'constansts.dart';

String FinalState;
String FinalCity;
List<String> ResultList = [];

class Resultscreen extends StatefulWidget {
  @override
  _ResultscreenState createState() => _ResultscreenState();
}

class _ResultscreenState extends State<Resultscreen> {
  getData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String state = prefs.getString('SelectedState');
    String city = prefs.getString('SelectedCity');
    List ResultList1 = await CovidData.getData1(state, city);

    setState(() {
      FinalCity = city;
      FinalState = state;
      ResultList = ResultList1;
    });
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kbackgroundColor,
        floatingActionButton: FloatingActionButton(
          child: Icon(
            Icons.home,
            color: Colors.white,
          ),
          backgroundColor: Color(0xff2666FB),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => Home()),
            );
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
        ),
        body: ResultList.length == 0
            ? Empty_Screen(context)
            : Non_Empty_Screen(context));
  }
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
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 8),
    child: Container(
      child: Center(
        child: Column(
          children: [
            Text(
              FinalState,
              style: GoogleFonts.mPlusRounded1c(
                  fontSize: 42, fontWeight: FontWeight.bold),
            ),
            Text(FinalCity,
                style: GoogleFonts.mPlusRounded1c(
                    fontSize: 32, fontWeight: FontWeight.bold)),
            SizedBox(
              height: 10,
            ),
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color(0xff292C36)),
              child: Column(
                children: [
                  ResultCell(
                    statement: 'Confirmed',
                    caseCount: 0,
                  ),
                  ResultCell(
                    statement: 'Active',
                    caseCount: 1,
                  ),
                  ResultCell(
                    statement: 'Recovered',
                    caseCount: 2,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      'Delta Variant',
                      style: GoogleFonts.mPlusRounded1c(
                          fontSize: 42,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff2666FB)),
                    ),
                  ),
                  ResultCell(
                    statement: 'Active',
                    caseCount: 3,
                  ),
                  ResultCell(
                    statement: 'Deceased',
                    caseCount: 4,
                  ),
                  ResultCell(
                    statement: 'Recovered',
                    caseCount: 5,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

class ResultCell extends StatelessWidget {
  ResultCell({this.caseCount, this.statement});
  final caseCount;
  final statement;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 10,
        ),
        Container(
          // decoration: BoxDecoration(
          //     color: Colors.blue, borderRadius: BorderRadius.circular(20)),
          padding: EdgeInsets.symmetric(vertical: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(statement, style: GoogleFonts.mPlusRounded1c(fontSize: 30)),
              SizedBox(
                width: 30,
              ),
              Text(
                ResultList[caseCount],
                style: GoogleFonts.mPlusRounded1c(fontSize: 25),
              )
            ],
          ),
        ),
      ],
    );
  }
}
