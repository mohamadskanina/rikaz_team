import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:rikaz_team/features/users_list/domain/entities/user.dart';
import 'dart:typed_data';

Future<pw.Document> exportUsersToPDF(List<User> users) async {
  final pdf = pw.Document();

  final Uint8List imageBytes = await rootBundle
      .load('images/rikaz-logo.png')
      .then((img) => img.buffer.asUint8List());

  pdf.addPage(
    pw.Page(
      build: (context) => pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          pw.Row(
            mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
            children: [
              pw.Column(
                children: [
                  pw.Text("Rikaz Company"),
                  pw.SizedBox(height: 2),
                  pw.Text(
                      'Date: ${DateTime.now().toString().substring(0, 10)}'),
                ],
                crossAxisAlignment: pw.CrossAxisAlignment.start,
              ),
              pw.Image(pw.MemoryImage(imageBytes), width: 60, height: 60)
            ],
          ),
          pw.SizedBox(height: 20),
          pw.Text('Users List',
              style: pw.TextStyle(
                fontSize: 24,
                fontWeight: pw.FontWeight.bold,
              ),
              textAlign: pw.TextAlign.center),
          pw.SizedBox(height: 10),
          pw.Text(
            'Total Users is : ${users.length}',
            style: pw.TextStyle(fontSize: 14, fontWeight: pw.FontWeight.bold),
          ),
          pw.SizedBox(height: 20),
          pw.TableHelper.fromTextArray(
            headers: ['First Name', 'Last Name', 'Email'],
            data: users
                .map((user) => [
                      user.first_name,
                      user.last_name,
                      user.email,
                    ])
                .toList(),
            cellStyle: const pw.TextStyle(fontSize: 12),
            headerStyle: pw.TextStyle(
              fontSize: 14,
              fontWeight: pw.FontWeight.bold,
            ),
            cellAlignment: pw.Alignment.centerLeft,
            columnWidths: {
              0: const pw.FlexColumnWidth(1),
              1: const pw.FlexColumnWidth(1),
              2: const pw.FlexColumnWidth(2),
            },
          ),
        ],
      ),
    ),
  );

  return pdf;
}
