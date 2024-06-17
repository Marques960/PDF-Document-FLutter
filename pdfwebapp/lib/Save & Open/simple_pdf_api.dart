import 'dart:io';

import 'package:pdf/widgets.dart';


class SimplePdfApi {
  static Future<File> generateSimpleTextPdf(String text, String text2) async {
    final pdf = Document();

    pdf.addPage(
      Page( 
        build: (_) => Center(
          child: Column(
            children: [
                
            ],
          ),
        ),
      ),
    );
  }
}       

