import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

Color kbackgroundColor = Color(0xff4D37B3);

dynamic KboxDeco = BoxDecoration(
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
    ]);

class GuideCard extends StatelessWidget {
  GuideCard(this.link);
  final String link;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 400,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15), color: Colors.blue[200]),
        child: LottieBuilder.network(link),
      ),
    );
  }
}
