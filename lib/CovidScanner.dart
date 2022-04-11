import 'package:covid/ResultScreen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:dio/dio.dart';
import 'package:lottie/lottie.dart';
import 'constansts.dart';

enum ScreenState {
  SHOW_MAIN_SCREEN,
  SHOW_RESULT,
  LOADING,
  COVID,
  NORMAL,
  PNEUMONIA,
}
int index = 0;
dynamic Result = 'NO Result';
dynamic Prob = 100;
List<Color> colorList = [Colors.red, Colors.green, Colors.yellow];
List<String> AnimList = [
  'https://assets4.lottiefiles.com/packages/lf20_0cfzhvrk.json',
  'https://assets10.lottiefiles.com/private_files/lf30_4avuVV.json',
  'https://assets6.lottiefiles.com/packages/lf20_uTKls9.json'
];
List<String> ResultList = ['Covid', 'Normal', 'Pneumonia'];
List<String> DesList = [
  'You are infected with the covid 19 virus.\n\n• Get vaccinated as soon as possible.\n\n• Isolate yourself from others.\n\n• Take rest and drink a lot of fluids for hydration',
  'Congratulations you are Normal.\n\n• Maintain Social Distancing\n\n• Eat healthy food\n\n• Wear Mask.',
  'You are infected with Pneumonia.\n\n• Drink plenty of fluids to help loosen secretions and bring up phlegm.\n\n• Do not take cough medicines without first talking to your doctor.'
];

File _image;
final picker = ImagePicker();
final cloudinary = CloudinaryPublic('doeq0cvif', 'pdje9ei1', cache: false);

class CovidScan extends StatefulWidget {
  @override
  State<CovidScan> createState() => _CovidScanState();
}

String img_url;
dynamic Current_State = ScreenState.SHOW_MAIN_SCREEN;

class _CovidScanState extends State<CovidScan> {
  @override
  Widget build(BuildContext context) {
    MainScreen(context) {
      return Scaffold(
          backgroundColor: kbackgroundColor,
          body: SafeArea(
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Lottie.network(
                        'https://assets4.lottiefiles.com/packages/lf20_0r0csU.json'),
                    Text(
                      'Select a X-Ray picture',
                      style: GoogleFonts.mPlusRounded1c(),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onTap: () async {
                            final image = await picker.getImage(
                                source: ImageSource.gallery);
                            Current_State = ScreenState.LOADING;
                            setState(() {});
                            try {
                              CloudinaryResponse response =
                                  await cloudinary.uploadFile(
                                CloudinaryFile.fromFile(image.path,
                                    resourceType: CloudinaryResourceType.Image),
                              );
                              img_url = response.secureUrl;
                              print(img_url);
                            } on CloudinaryException catch (e) {
                              print(e.message);
                              print(e.request);
                            }

                            var dio = Dio();
                            dynamic response1 = await dio.post(
                                'https://delta-diagnose-api.herokuapp.com/',
                                data: {'url': img_url});
                            print(response1.data);
                            Result = response1.data;
                            Prob = response1.data['class_probablity'];
                            setState(() {
                              if (image != null) {
                                _image = File(image.path);
                                Result = response1.data;
                                Current_State = Resultscreen(context);
                              } else {
                                Current_State = ScreenState.SHOW_MAIN_SCREEN;
                              }
                            });
                          },
                          child: Container(
                            child: Icon(Icons.photo),
                            height: 70,
                            width: 70,
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
                                      color: Colors.deepPurple[500],
                                      offset: Offset(-4, -4),
                                      blurRadius: 15,
                                      spreadRadius: 1)
                                ]),
                          ),
                        ),
                        GestureDetector(
                          onTap: () async {
                            final image = await picker.getImage(
                                source: ImageSource.camera);
                            Current_State = ScreenState.LOADING;
                            setState(() {});
                            try {
                              CloudinaryResponse response =
                                  await cloudinary.uploadFile(
                                CloudinaryFile.fromFile(image.path,
                                    resourceType: CloudinaryResourceType.Image),
                              );
                              img_url = response.secureUrl;
                              print(img_url);
                            } on CloudinaryException catch (e) {
                              print(e.message);
                              print(e.request);
                            }
                            var dio = Dio();
                            dynamic response1 = await dio.post(
                                'https://delta-diagnose-api.herokuapp.com/',
                                data: {'url': img_url});
                            print(response1.data);
                            Result = response1.data;
                            Prob = response1.data['class_probablity'];
                            setState(() {
                              if (image != null) {
                                _image = File(image.path);
                                Result = response1.data;
                                Current_State = Resultscreen(context);
                              } else {
                                Current_State = ScreenState.SHOW_MAIN_SCREEN;
                              }
                            });
                          },
                          child: Container(
                            child: Icon(Icons.camera),
                            height: 70,
                            width: 70,
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
                                      color: Colors.deepPurple[500],
                                      offset: Offset(-4, -4),
                                      blurRadius: 15,
                                      spreadRadius: 1)
                                ]),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ));
    }

    return Current_State == ScreenState.SHOW_MAIN_SCREEN
        ? MainScreen(context)
        : Current_State == ScreenState.LOADING
            ? Loading(context)
            : Resultscreen(context);
  }
}

Loading(context) {
  return Scaffold(
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          // LottieBuilder.asset('assets/pre.json'),
          // LottieBuilder.asset(
          //   './assets/loading2.json',
          // ),
          LottieBuilder.network(
              'https://assets3.lottiefiles.com/private_files/lf30_ykdoon9j.json')
        ],
      ),
    ),
  );
}

Resultscreen(context) {
  Result['class'] == 'covid'
      ? index = 0
      : Result['class'] == 'normal'
          ? index = 1
          : index = 2;
  index = 1;
  return Scaffold(
    backgroundColor: kbackgroundColor,
    body: SafeArea(
      child: Center(
        child: Container(
          // padding: EdgeInsets.all(3),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Text(
                'Report',
                style: GoogleFonts.mPlusRounded1c(
                  fontSize: 60,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
              Container(
                  height: MediaQuery.of(context).size.height * 0.38,
                  child: LottieBuilder.network(AnimList[index])),
              Container(
                height: MediaQuery.of(context).size.height / 2.2,
                child: Stack(
                  children: [
                    Container(
                      padding: EdgeInsets.all(10),
                      child: Column(children: [
                        Text(ResultList[index],
                            style: GoogleFonts.mPlusRounded1c(
                                fontSize: 60,
                                color: colorList[index],
                                fontWeight: FontWeight.bold)),
                        Text(
                          'Likelyhood -  $Prob',
                          style: GoogleFonts.roboto(
                              fontSize: 25,
                              color: Colors.white,
                              fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          DesList[index],
                          style: GoogleFonts.montserrat(),
                        ),
                      ]),
                      height: MediaQuery.of(context).size.height * 0.40,
                      width: MediaQuery.of(context).size.width - 30,
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
                    Positioned(
                      top: MediaQuery.of(context).size.height / 1.13 * 0.40,
                      right: (MediaQuery.of(context).size.width / 2) -
                          (MediaQuery.of(context).size.width / 7.7),
                      child: GestureDetector(
                        onTap: () {
                          Current_State = ScreenState.SHOW_MAIN_SCREEN;
                          Navigator.pop(context);
                        },
                        child: Container(
                          height: 70,
                          width: 70,
                          child: Icon(Icons.home),
                          decoration: BoxDecoration(
                              color: Color(0xff4D37B3),
                              borderRadius: BorderRadius.circular(50),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.deepPurple[900],
                                    blurRadius: 10,
                                    offset: Offset(4, 4),
                                    spreadRadius: 1),
                                BoxShadow(
                                    color: Colors.deepPurple[700],
                                    offset: Offset(-4, -4),
                                    blurRadius: 10,
                                    spreadRadius: 1),
                                BoxShadow(
                                    color: Colors.deepPurple[600],
                                    offset: Offset(-4, -4),
                                    blurRadius: 10,
                                    spreadRadius: 1)
                              ]),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    ),
  );
}
