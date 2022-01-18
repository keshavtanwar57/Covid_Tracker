import 'package:flutter/material.dart';
import 'constansts.dart';
import 'package:google_fonts/google_fonts.dart';
import 'home.dart';

class symptoms extends StatefulWidget {
  @override
  _symptomsState createState() => _symptomsState();
}

class _symptomsState extends State<symptoms> {
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
        title: Text('Symptoms',
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
                    'https://assets2.lottiefiles.com/packages/lf20_z2f2mw8k.json'),
                GuideCard(
                    'https://assets2.lottiefiles.com/packages/lf20_n14mb979.json'),
                GuideCard(
                    'https://assets2.lottiefiles.com/packages/lf20_kdlseuzc.json'),
                GuideCard(
                    'https://assets2.lottiefiles.com/packages/lf20_jo4emcui.json'),
                GuideCard(
                    'https://assets2.lottiefiles.com/packages/lf20_iy6aj3i3.json'),
                GuideCard(
                    'https://assets2.lottiefiles.com/packages/lf20_abjz0yby.json'),
                GuideCard(
                    'https://assets2.lottiefiles.com/packages/lf20_oqufqaim.json')
              ],
            ),
          ),
        ),
      ),
    );
  }
}
