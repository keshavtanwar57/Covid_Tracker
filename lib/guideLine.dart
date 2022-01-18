import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'constansts.dart';
import 'Home.dart';

class Guideline extends StatefulWidget {
  @override
  _GuidelineState createState() => _GuidelineState();
}

class _GuidelineState extends State<Guideline> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        title: Text('Precautions',
            style: GoogleFonts.mPlusRounded1c(
              fontSize: 50,
            )),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: kbackgroundColor,
        elevation: 0,
      ),
      backgroundColor: kbackgroundColor,
      body: SafeArea(
        child: Scrollbar(
          child: SingleChildScrollView(
            child: Column(
              children: [
                GuideCard(
                    'https://assets2.lottiefiles.com/packages/lf20_xbeapo0i.json'),
                GuideCard(
                    'https://assets2.lottiefiles.com/packages/lf20_zczlo413.json'),
                GuideCard(
                    'https://assets2.lottiefiles.com/packages/lf20_1ntvvmsz.json'),
                GuideCard(
                    'https://assets2.lottiefiles.com/packages/lf20_rv8lfct8.json'),
                GuideCard(
                    'https://assets1.lottiefiles.com/packages/lf20_imsphcho.json')
              ],
            ),
          ),
        ),
      ),
    );
  }
}
