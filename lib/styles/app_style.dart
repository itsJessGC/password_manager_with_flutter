import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class App_Style{

  //Default colors for style
  static Color backgroundColor = Color(0xFFE2E2FE);
  static Color mainColor = Color(0x3d405b);
  static Color accentColor = Color(0xFF0065FF);

  //Setting the cards different color
  static List<Color> colorOfCards = [
    Colors.white,
    Colors.red.shade100,
    Colors.pink.shade100,
    Colors.orange.shade100,
    Colors.yellow.shade100,
    Colors.green.shade100,
    Colors.blue.shade100,
    Colors.blueGrey.shade100
  ];

  //Setting the text style
  static TextStyle mainTitle = GoogleFonts.roboto(
    fontSize: 18.0, 
    fontWeight: FontWeight.bold
  );
  static TextStyle mainContent = GoogleFonts.nunito(
    fontSize: 16.0, 
    fontWeight: FontWeight.normal
  );
  static TextStyle dateTitle = GoogleFonts.roboto(
    fontSize: 13.0, 
    fontWeight: FontWeight.w500
  );
}