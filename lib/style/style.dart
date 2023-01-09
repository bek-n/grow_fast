import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class Style {
  Style._();

  // ---------- Color   ---------- //

  static const primaryColor = Color(0xff26AD71);
  static const greyColor = Color(0xff777777);
  static const white = Colors.white;
  static const black = Colors.black;
  static const bgCategory = Color(0xffEBF1F4);
  static Color shimmerBase = Colors.grey.shade300;
  static Color bgOfproductsContainer = Color(0xffF1F4F3);
  static const colorOftitle = Color(0xff194B38);
  static const colorOfPrice = Color(0xff4CBB5E);

  // ---------- Text   ---------- //

  static textStyleofTitle({double size = 15, Color textColor = colorOftitle}) =>
      GoogleFonts.raleway(fontSize: size, fontWeight: FontWeight.w700);

  static textStyleofPrice({
    double size = 24,
    Color textColor = colorOfPrice,
  }) =>
      GoogleFonts.montserrat(fontSize: size, fontWeight: FontWeight.w600);
}
