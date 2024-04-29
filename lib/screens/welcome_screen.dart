import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OpenWidget extends StatelessWidget {
  const OpenWidget({super.key});

  get style => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          width: 390,
          height: 844,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment(6.123234262925839e-17, 1),
                end: Alignment(-1, 6.123234262925839e-17),
                colors: [
                  Color.fromRGBO(164, 95, 44, 1),
                  Color.fromRGBO(128, 64, 18, 1),
                  Color.fromRGBO(164, 95, 45, 1)
                ]),
          ),
          child: Stack(children: <Widget>[
            Center(
              child: Text(
                'PharaohQuest',
                textAlign: TextAlign.center,
                style: GoogleFonts.oswald(
                  textStyle: const TextStyle(
                      color: Color.fromRGBO(255, 255, 255, 1),
                      fontSize: 30,
                      letterSpacing: 0,
                      fontWeight: FontWeight.normal,
                      height: 1),
                ),
              ),
            ),
          ])),
    );
  }
}
