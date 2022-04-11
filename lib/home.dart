import 'package:covid/States.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'service.dart';
import 'Syntoms.dart';
import 'constansts.dart';
import 'CovidScanner.dart';
import 'guideLine.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kbackgroundColor,
      body: SafeArea(
        child: Container(
          //height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.5,
                child: LottieBuilder.network(
                    'https://assets10.lottiefiles.com/packages/lf20_eDM9E4.json'),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => States()),
                  );
                },
                child: Container(
                  width: 280,
                  child: Center(
                    child: Text('Covid Status',
                        style: GoogleFonts.mPlusRounded1c(
                            fontSize: 30, color: Colors.white)),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  decoration: BoxDecoration(
                      color: Color(0xff4D37B3),
                      borderRadius: BorderRadius.circular(50),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.deepPurple[900],
                            blurRadius: 15,
                            offset: Offset(4, 4),
                            spreadRadius: 1),
                        BoxShadow(
                            color: Colors.deepPurple[700],
                            offset: Offset(-4, -4),
                            blurRadius: 15,
                            spreadRadius: 1),
                        BoxShadow(
                            color: Colors.deepPurple[500],
                            offset: Offset(-4, -4),
                            blurRadius: 15,
                            spreadRadius: 1)
                      ]),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Guideline()),
                  );
                },
                child: Container(
                  width: 280,
                  child: Center(
                    child: Text('Precautions',
                        style: GoogleFonts.mPlusRounded1c(
                            fontSize: 30, color: Colors.white)),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  decoration: BoxDecoration(
                      color: Color(0xff4D37B3),
                      borderRadius: BorderRadius.circular(50),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.deepPurple[900],
                            blurRadius: 15,
                            offset: Offset(4, 4),
                            spreadRadius: 1),
                        BoxShadow(
                            color: Colors.deepPurple[700],
                            offset: Offset(-4, -4),
                            blurRadius: 15,
                            spreadRadius: 1),
                        BoxShadow(
                            color: Colors.deepPurple[500],
                            offset: Offset(-4, -4),
                            blurRadius: 15,
                            spreadRadius: 1)
                      ]),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => symptoms()),
                  );
                },
                child: Container(
                  width: 280,
                  child: Center(
                    child: Text('Symptoms',
                        style: GoogleFonts.mPlusRounded1c(
                            fontSize: 30, color: Colors.white)),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  decoration: BoxDecoration(
                      color: Color(0xff4D37B3),
                      borderRadius: BorderRadius.circular(50),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.deepPurple[900],
                            blurRadius: 15,
                            offset: Offset(4, 4),
                            spreadRadius: 1),
                        BoxShadow(
                            color: Colors.deepPurple[700],
                            offset: Offset(-4, -4),
                            blurRadius: 15,
                            spreadRadius: 1),
                        BoxShadow(
                            color: Colors.deepPurple[500],
                            offset: Offset(-4, -4),
                            blurRadius: 15,
                            spreadRadius: 1)
                      ]),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CovidScan()),
                  );
                },
                child: Container(
                  width: 280,
                  child: Center(
                    child: Text('Covid Scan',
                        style: GoogleFonts.mPlusRounded1c(
                            fontSize: 30, color: Colors.white)),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  decoration: BoxDecoration(
                      color: Color(0xff4D37B3),
                      borderRadius: BorderRadius.circular(50),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.deepPurple[900],
                            blurRadius: 15,
                            offset: Offset(4, 4),
                            spreadRadius: 1),
                        BoxShadow(
                            color: Colors.deepPurple[700],
                            offset: Offset(-4, -4),
                            blurRadius: 15,
                            spreadRadius: 1),
                        BoxShadow(
                            color: Colors.deepPurple[500],
                            offset: Offset(-4, -4),
                            blurRadius: 15,
                            spreadRadius: 1)
                      ]),
                ),
              ),

              SizedBox(
                height: 20,
              ),

              // SizedBox(
              //   height: 50,
              // ),
              Text(
                'Keshav Tanwar',
                style: TextStyle(color: Colors.white24),
              ),
              SizedBox(
                height: 1,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
