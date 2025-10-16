import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/constraints.dart';
import '../utils/utils.dart';

class MyTheme {
  static final borderRadius = BorderRadius.circular(10.0);
  static final theme = ThemeData(
      brightness: Brightness.light,
      primaryColor: whiteColor,

      scaffoldBackgroundColor: scaffoldBgColor,
       bottomSheetTheme: const BottomSheetThemeData(backgroundColor: whiteColor),

      appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        scrolledUnderElevation: 0.0,
        titleTextStyle: GoogleFonts.kumbhSans(
            color: blackColor, fontSize: 20, fontWeight: FontWeight.bold),
        iconTheme: const IconThemeData(color: blackColor),
        elevation: 0,
      ),
      textTheme: GoogleFonts.kumbhSansTextTheme(
        TextTheme(
          bodySmall: GoogleFonts.kumbhSans(fontSize: 14, height: 1.83),
          bodyLarge: GoogleFonts.kumbhSans(
              fontSize: 16, fontWeight: FontWeight.w500, height: 1.375),
          bodyMedium: GoogleFonts.kumbhSans(fontSize: 14, height: 1.5714),
          labelLarge: GoogleFonts.kumbhSans(
              fontSize: 16, height: 2, fontWeight: FontWeight.w600),
          titleLarge: GoogleFonts.kumbhSans(
              fontSize: 16, height: 2, fontWeight: FontWeight.w600),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(double.infinity, 64),
          backgroundColor: whiteColor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),
        ),
      ),
      textButtonTheme: const TextButtonThemeData(
        style: ButtonStyle(
            shadowColor: WidgetStatePropertyAll(transparent),
            elevation: WidgetStatePropertyAll(0.0),
            iconSize: WidgetStatePropertyAll(20.0),
            splashFactory: NoSplash.splashFactory,
            overlayColor: WidgetStatePropertyAll(
              (transparent),
            ),
            padding: WidgetStatePropertyAll(EdgeInsets.zero)),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        elevation: 3,
        backgroundColor: whiteColor,
        showUnselectedLabels: true,
        selectedLabelStyle: GoogleFonts.kumbhSans(
          fontWeight: FontWeight.w400,
          color: textColor,
          fontSize: 14.0,
        ),
        unselectedLabelStyle: GoogleFonts.kumbhSans(
          fontWeight: FontWeight.w400,
          color: blackColor,
          fontSize: 14.0,
        ),
        selectedItemColor: textColor,
        unselectedItemColor: blackColor,
      ),

      inputDecorationTheme: InputDecorationTheme(
        isDense: true,
        hintStyle: GoogleFonts.kumbhSans(
          fontWeight: FontWeight.w400,
          fontSize: 14.0,
          color: const Color(0xFFCBD5E1),
        ),
        labelStyle: GoogleFonts.kumbhSans(
          fontWeight: FontWeight.w400,
          fontSize: 14.0,
          color: sTextColor,
        ),
        contentPadding: const EdgeInsets.symmetric(vertical: 17.0, horizontal: 20.0),
        fillColor: const Color(0xFFF8FAFC),
        filled: true,
        border: InputBorder.none, // No border initially
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.zero,
          borderSide: BorderSide(
            color: borderColor,
            width: 2.0,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.zero,
          borderSide: BorderSide(
            color: borderColor,
            width: 2.0,
          ),
        ),
      ),
      textSelectionTheme:  TextSelectionThemeData(
        cursorColor: blackColor,
        selectionColor: primaryColor.withOpacity(0.5),
        selectionHandleColor: primaryColor,
      ),
      progressIndicatorTheme:
          const ProgressIndicatorThemeData(color: primaryColor));
}
