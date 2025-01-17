import 'package:flutter/material.dart';

class TColor{
  static Color get primaryColor1 => const Color(0xFFB22222);
  static Color get primaryColor2 => const Color(0xFFFF5C5C);

  static Color get secondaryColor1 => const Color.fromARGB(255, 0, 0, 0);
  static Color get secondaryColor2 => const Color.fromARGB(255, 0, 0, 0);

  static Color get tertiaryColor1 => const Color.fromARGB(255, 255, 255, 255);
  static Color get tertiaryColor2 => const Color.fromARGB(255, 255, 255, 255);

  static Color get fourthColor1 => const Color(0xFFB22222);
  static Color get fourthColor2 => const Color(0xFFFF5C5C);

  static List<Color> get primaryG => [primaryColor2, primaryColor1];
  static List<Color> get secondaryG => [secondaryColor1, secondaryColor2];
  static List<Color> get tertiaryG => [tertiaryColor1, tertiaryColor2];
   static List<Color> get fourthG => [fourthColor2, fourthColor1];

  static Color get black => const Color(0xff101617);
  static Color get white => Colors.white;
  static Color get grey => const Color(0xff786F72);
  static Color get lightGrey => const Color(0xffF5F5F5);
  static Color get darkGrey => const Color.fromARGB(255, 50, 48, 48);




}