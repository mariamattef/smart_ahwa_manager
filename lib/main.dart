import 'package:flutter/material.dart';
import 'package:smart_ahwa_manager/core/screens/bottom_nav_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const int primaryColor = 0xFF38e07b;
    const MaterialColor emerald = MaterialColor(primaryColor, <int, Color>{
      50: Color(0xFFE7FCEC),
      100: Color(0xFFC4F6D7),
      200: Color(0xFF9DEFB9),
      300: Color(0xFF75E89B),
      400: Color(0xFF57E285),
      500: Color(primaryColor),
      600: Color(0xFF33DA72),
      700: Color(0xFF2CD967),
      800: Color(0xFF25D85D),
      900: Color(0xFF1AD64A),
    });

    return MaterialApp(
      title: 'New Order Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: emerald,
        fontFamily: 'Epilogue',
        scaffoldBackgroundColor: const Color(0xFFF9FAFB), 
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.white,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16.0,
            vertical: 14.0,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: const BorderSide(
              color: Color(0xFFD1D5DB), // border-gray-300
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: const BorderSide(color: Color(0xFFD1D5DB)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: const BorderSide(
              color: Color(primaryColor),
              width: 2.0,
            ),
          ),
          hintStyle: const TextStyle(
            color: Color(0xFF9CA3AF),
          ), // placeholder color
        ),
      ),
      home: const BottomNavBar(),
    );
  }
}
