// ignore_for_file:depend_on_referenced_packages
// ignore_for_file: prefer_const_literals_to_create_immutables 
// ignore_for_file: prefer_const_constructors
// ignore_for_file: camel_case_types
// ignore_for_file: prefer_const_declarations
// ignore_for_file:
// ignore_for_file:
// ignore_for_file:
// ignore_for_file:


//imports
import 'package:flutter/material.dart';
import 'package:pdfwebapp/pdf_page1.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter PDF Printer',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Pdfpage(),
    );
  }
}

