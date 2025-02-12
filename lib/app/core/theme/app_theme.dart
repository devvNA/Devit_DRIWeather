import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_color.dart';

// Konfigurasi tema utama aplikasi
ThemeData myTheme = ThemeData(
  // Mengatur tema AppBar dengan warna latar freshgreen
  appBarTheme: const AppBarTheme(
    backgroundColor: AppColors.freshgreen,
  ),

  useMaterial3: true,

  scrollbarTheme: ScrollbarThemeData().copyWith(
    radius: const Radius.circular(10),
    thumbColor: MaterialStateProperty.all(Colors.grey[50]),
  ),

  // Mengatur tema BottomAppBar dengan warna latar freshgreen
  bottomAppBarTheme: const BottomAppBarTheme(
    color: AppColors.freshgreen,
  ),

  // Menggunakan font Nunito dari Google Fonts untuk seluruh teks
  textTheme: GoogleFonts.overpassTextTheme(),

  // Mengatur warna primer aplikasi menjadi hitam
  primaryColor: AppColors.black,

  // Mengatur warna latar belakang scaffold menjadi putih
  scaffoldBackgroundColor: AppColors.deepwhite,
);
