//ignorances
// ignore_for_file: depend_on_referenced_packages 
// ignore_for_file: unused_local_variable
// ignore_for_file: prefer_const_constructors
// ignore_for_file: camel_case_types
// ignore_for_file: prefer_const_declarations
// ignore_for_file:
// ignore_for_file:
// ignore_for_file:
// ignore_for_file:


//imports
import 'package:flutter/material.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:pdf/pdf.dart';

class Pdfpage extends StatefulWidget {
  const Pdfpage({super.key});

  @override
  State<Pdfpage> createState() => _pdfpageState();
}

class _pdfpageState extends State<Pdfpage> {

  // Method for printing the PDF
  Future<void> _printPdf() async {
    // screen dimensions
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    final pdf = pw.Document();
    pdf.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          return pw.Center(
            child: pw.Container(
              width: (screenWidth),
              height: screenHeight,
              //color: PdfColor.fromInt(0xFFFFFFFF),
              color: PdfColor.fromHex("#FFFF00"),
              child: pw.Center(
                child: pw.Column(
                  children: [
                    pw.Container(
                      height: 200,
                      child: pw.CustomPaint(
                        size: PdfPoint(300, 300),
                        painter: drawBarChart, 
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
    await Printing.layoutPdf(
      onLayout: (PdfPageFormat format) async => pdf.save(),
    );
  }

  //pdf
  void drawBarChart(PdfGraphics canvas, PdfPoint size) {
    final data = [50, 40, 30, 20, 10];
    final barWidth = size.x / (2 * data.length);
    final maxDataValue = data.reduce((a, b) => a > b ? a : b);

    for (int i = 0; i < data.length; i++) {
      final barHeight = (data[i] / maxDataValue) * size.y;
      final x = i * 2 * barWidth;
      final int y = 0;
      canvas.drawRect(x, y as double, barWidth, barHeight);
      canvas.setFillColor(PdfColors.blue);
      canvas.fillPath();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text("PDF"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FloatingActionButton(
            onPressed: _printPdf,
            tooltip: 'Print',
            child: const Icon(Icons.print),
          ),
          ],
        ),
      ),
    );
  }
}