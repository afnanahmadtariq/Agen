import 'dart:io';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter_html_to_pdf/flutter_html_to_pdf.dart';

Future<void> requestStoragePermission() async {
  final status = await Permission.storage.request();
  if (status.isGranted) {
    // Write to the file here
  } else if (status.isPermanentlyDenied) {
    print('Storage permission permanently denied');
    await openAppSettings();
  } else {
    print('Storage permission denied');
  }
}

Future<File> convertHtmlToPdf(String htmlContent, String targetPath, String targetFileName) async {
  final generatedPdfFile = await FlutterHtmlToPdf.convertFromHtmlContent(
    htmlContent,
    targetPath,
    targetFileName,
  );
  return generatedPdfFile;
}