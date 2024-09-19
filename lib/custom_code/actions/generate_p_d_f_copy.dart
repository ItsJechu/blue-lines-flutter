// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/sqlite/sqlite_manager.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:typed_data';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'dart:ui' as ui; // Importa dart:ui para Color y ImageByteFormat

Future<void> generatePDFCopy(
    String cosechadornombre, String cosechadordni) async {
  final pdf = pw.Document();

  // Crear un QR basado en el nombre
  final qrImage = await generateQr(cosechadornombre);

  pdf.addPage(
    pw.Page(
      pageFormat: PdfPageFormat(5 * PdfPageFormat.cm,
          7 * PdfPageFormat.cm), // Ajustar el tamaño de la página
      build: (pw.Context context) {
        return pw.Center(
          child: pw.Container(
            width: 5 * PdfPageFormat.cm,
            height: 7 * PdfPageFormat.cm,
            decoration: pw.BoxDecoration(
              border: pw.Border.all(color: PdfColors.black, width: 1),
            ),
            child: pw.Column(
              mainAxisAlignment: pw.MainAxisAlignment.center,
              children: [
                pw.SizedBox(height: 10),
                pw.Text(
                  "Carnet de Trabajador",
                  style: pw.TextStyle(
                      fontSize: 12), // Ajustar el tamaño de la fuente
                ),
                pw.SizedBox(height: 5),
                pw.Text(
                  "Nombre: $cosechadornombre",
                  style: pw.TextStyle(
                      fontSize: 10), // Ajustar el tamaño de la fuente
                ),
                pw.Text(
                  "DNI: $cosechadordni",
                  style: pw.TextStyle(
                      fontSize: 10), // Ajustar el tamaño de la fuente
                ),
                pw.SizedBox(height: 10),
                if (qrImage != null)
                  pw.Image(
                    pw.MemoryImage(qrImage),
                    width: 100, // Ajustar el tamaño del QR
                    height: 100, // Ajustar el tamaño del QR
                  ),
                if (qrImage == null)
                  pw.Text(
                    'Error al generar el QR',
                    style: pw.TextStyle(color: PdfColors.red),
                  ),
              ],
            ),
          ),
        );
      },
    ),
  );

  // Mostrar el PDF generado
  await Printing.layoutPdf(
      onLayout: (PdfPageFormat format) async => pdf.save());
}

// Función para generar el QR y convertirlo en una imagen
Future<Uint8List?> generateQr(String data) async {
  try {
    final qrValidationResult = QrValidator.validate(
      data: data,
      version: QrVersions.auto,
      errorCorrectionLevel: QrErrorCorrectLevel.L,
    );

    if (qrValidationResult.status == QrValidationStatus.error) {
      print('Error al validar el código QR');
      return null;
    }

    final qrCode = qrValidationResult.qrCode;

    final painter = QrPainter.withQr(
      qr: qrCode!,
      eyeStyle: QrEyeStyle(
        color: const ui.Color(0xFF000000), // Color de los ojos del QR
      ),
      dataModuleStyle: QrDataModuleStyle(
        color: const ui.Color(0xFF000000), // Color de los módulos del QR
      ),
      gapless: true,
    );

    // Ajusta el tamaño del QR code
    final image = await painter.toImage(300); // Ajustar el tamaño para el QR
    final byteData = await image.toByteData(format: ui.ImageByteFormat.png);

    if (byteData == null) {
      print('Error al convertir la imagen del QR a ByteData');
      return null;
    }

    print('QR generado exitosamente');
    return byteData.buffer.asUint8List();
  } catch (e) {
    print('Error al generar el QR: $e');
    return null;
  }
}
