// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, camel_case_types

import 'package:flutter/material.dart';

class choose extends StatefulWidget {
  const choose({super.key});

  @override
  State<choose> createState() => _ChosseState();
}

class _ChosseState extends State<choose> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 100),
            //simple pdf
            ElevatedButton(
              onPressed: () async {},
              child: Text(
                "Simpe Pdf",
              ),
            ),
            SizedBox(height: 20),
            //paragraph pdf
            ElevatedButton(
              onPressed: () async {},
              child: Text(
                "Paragraph Pdf",
              ),
            ),
            SizedBox(height: 20),
            //table pdf
            ElevatedButton(
              onPressed: () async {},
              child: Text(
                "Table Pdf Pdf",
              ),
            ),
            SizedBox(height: 20),
            //image pdf
            ElevatedButton(
              onPressed: () async {},
              child: Text(
                "Image Pdf",
              ),
            ),
          ],
        ),
      ),
    );
  }
}