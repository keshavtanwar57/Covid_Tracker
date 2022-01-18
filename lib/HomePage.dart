import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'home.dart';
import 'constansts.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kbackgroundColor,
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              Text('Covid - 19',
                  style: GoogleFonts.mPlusRounded1c(fontSize: 50)),
              Expanded(
                child: Lottie.network(
                    'https://assets5.lottiefiles.com/packages/lf20_3gmen1kz.json'),
                flex: 1,
              ),
              SizedBox(
                height: 80,
              ),
              Center(
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Home()),
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 7),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(100)),
                    child: Text(
                      '>',
                      style: TextStyle(fontSize: 40, color: Colors.black),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 80,
              ),
              Text(
                'Keshav Tanwar',
                style: TextStyle(color: Colors.white70),
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
