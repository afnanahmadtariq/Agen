import 'dart:io';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:html_to_pdf_plus/html_to_pdf_plus.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter/material.dart';

class Save{
  static Future<void> requestStoragePermission() async {
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

  static Future<void> downloadPdfFile(String htmlContent, String fileName) async {
    print('a giya');
    requestStoragePermission();
    print('ho gai');
    // Get the directory to save the PDF
    final directory = await getApplicationDocumentsDirectory();
    print('chla giya');
    // Create a new file path
    final filePath = '${directory?.path}/$fileName.pdf';

    // Check for storage permission (optional)
    final status = await Permission.storage.request();
    if (!status.isGranted) {
      throw Exception('Storage permission is required to download the file.');
    }



    // Write the downloaded bytes to the file
    final file = File(filePath);

    var generatedPdfFile = await HtmlToPdf.convertFromHtmlContent(
    htmlContent: htmlContent,
    configuration: PdfConfiguration(
      targetDirectory: directory!.path, 
      targetName: fileName,
      printSize: PrintSize.A4,
      printOrientation: PrintOrientation.Portrait,
      )
    );
    // Show a success message (optional)
    print('PDF downloaded successfully to $filePath');
  }
}
  









 Future<List<FileSystemEntity>> getPdfFilesInDirectory(Directory directory) async {
    final files = await directory.list().where((file) => file.path.endsWith('.pdf')).toList();
    return files;
  }




void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await requestStoragePermission(); // Request permission if necessary

  runApp(const DOwnis());
}




class DOwnis extends StatefulWidget {
  const DOwnis({super.key});

  @override
  _DOwnisState createState() => _DOwnisState();
}

class _DOwnisState extends State<DOwnis> {
  List<FileSystemEntity> _pdfFiles = []; // List to store found PDF files

  Future<void> loadPdfFiles() async {
    final appDirectory = await getApplicationDocumentsDirectory();
    if (appDirectory != null) {
      print(appDirectory.toString());
      _pdfFiles = await getPdfFilesInDirectory(appDirectory);
    }
  }

  @override
  void initState() {
    super.initState();
    loadPdfFiles();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('PDF Reader'), 
        ),
        body: ListView.builder(
          itemCount: _pdfFiles.length,
          itemBuilder: (context, index) {
            final pdfFile = _pdfFiles[index];
            return ListTile(
              title: Text(pdfFile.path.split('/').last), // Display filename only
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PDFView(
                    filePath: pdfFile.path,
                    preventLinkNavigation: false,  
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
