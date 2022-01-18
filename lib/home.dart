import 'package:covid/States.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'service.dart';
import 'Syntoms.dart';
import 'constansts.dart';
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
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              Expanded(
                child: LottieBuilder.network(
                    'https://assets10.lottiefiles.com/packages/lf20_eDM9E4.json'),
                flex: 1,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => States()),
                  );
                },
                child: Container(
                  width: 300,
                  child: Center(
                    child: Text('Covid Status',
                        style: GoogleFonts.mPlusRounded1c(
                            fontSize: 30, color: Colors.black)),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(100)),
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
                  width: 300,
                  child: Center(
                    child: Text('Precautions',
                        style: GoogleFonts.mPlusRounded1c(
                            fontSize: 30, color: Colors.black)),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(100)),
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
                  width: 300,
                  child: Center(
                    child: Text('Symptoms',
                        style: GoogleFonts.mPlusRounded1c(
                            fontSize: 30, color: Colors.black)),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(100)),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              SizedBox(
                height: 50,
              ),
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
