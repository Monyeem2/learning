
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'data_collection.dart';
import 'design_dashboard.dart';
import 'first_class.dart';
import 'fl_chart.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo BMI',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        textTheme: GoogleFonts.manropeTextTheme(), // Example of using Poppins font
      ),
      home: Design_Dashboard(),
      // home: BarChartSample2(),

    );
  }
}
