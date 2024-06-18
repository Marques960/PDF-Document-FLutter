//ignorances
// ignore_for_file: depend_on_referenced_packages, avoid_print, unused_element
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
import 'package:pdfwebapp/style.dart';
import 'package:printing/printing.dart';
import 'package:pdf/pdf.dart';

class Pdfpage extends StatefulWidget {
  const Pdfpage({super.key});

  @override
  State<Pdfpage> createState() => _pdfpageState();
}

class _pdfpageState extends State<Pdfpage> {

  String var1 = "func1";
  String var2 = "func2";
  String var3 = "func3";
  String var4 = "func4";
  String var5 = "func5";

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
              width: screenWidth,
              height: screenHeight,
              color: PdfColor.fromHex("#E0E0E0"),
              child: pw.Center(
                child: pw.Column(
                  children: [
                    pw.SizedBox(height: 20),
                    //header of the page (optional)
                    pw.Text(
                      "Gestão RFS",
                      style: pw.TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    //define the content for your pdf page
                    pw.SizedBox(height: 20),
                    pw.Container(
                      child: drawBarChart(
                          PdfPoint((screenWidth / 5), (screenHeight / 3))),
                    ),
                    pw.Container(
                      alignment: pw.Alignment.center,
                      margin: pw.EdgeInsets.only(top: 10),
                      child: pw.Row(
                        children: [
                          pw.SizedBox(width: 80),
                          pw.Padding(
                            padding: pw.EdgeInsets.only(left: 30),
                            child:  pw.Text(
                              var1,
                              style: textStyle,
                            ),
                          ),
                          pw.Padding(
                            padding: pw.EdgeInsets.only(left: 20),
                            child:  pw.Text(
                              var2,
                              style: textStyle,
                            ),
                          ),
                          pw.Padding(
                            padding: pw.EdgeInsets.only(left: 20),
                            child:  pw.Text(
                              var3,
                              style: textStyle,
                            ),
                          ),
                          pw.Padding(
                            padding: pw.EdgeInsets.only(left: 20),
                            child:  pw.Text(
                              var4,
                              style: textStyle,
                            ),
                          ),
                          pw.Padding(
                            padding: pw.EdgeInsets.only(left: 20),
                            child:  pw.Text(
                              var5,
                              style: textStyle,
                            ),
                          ),
                          pw.Spacer(),
                        ],
                      ),
                    ),
                    pw.Spacer(),
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

  pw.Widget drawBarChart(PdfPoint size) {
    final data = [100, 30, 60, 40, 75];
    final barWidth = size.x / (2 * data.length);
    final List<String> teste = [
      "Rafael",
      "Rafael",
      "Rafael",
      "Rafael",
      "Rafael",
      "Rafael",
      "Rafael"
    ];
    final maxDataValue = data.reduce((a, b) => a > b ? a : b);

    return pw.Container(
      width: size.x,
      height: size.y,
      child: pw.Stack(
        children: [
          for (int i = 0; i < data.length; i++)
            pw.Positioned(
              left: i * 2 * barWidth,
              bottom: 0,
              child: pw.Container(
                width: barWidth,
                height: (data[i] / maxDataValue) * size.y,
                color: PdfColors.blue,
              ),
            ),
        ],
      ),
    );
  }

  // Save the PDF file
  // You need to handle saving the PDF file as per your requirements

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
              child: const Icon(Icons.picture_as_pdf),
            ),
          ],
        ),
      ),
    );
  }
}
