import 'dart:io';
import 'package:agen/screen_factory.dart';
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

  static Future<void> downloadPdfFile(BuildContext context, String htmlContent, String fileName) async {
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
    Navigator.pop(context);
    downloadComplete(context, filePath);
  }


  static Future<dynamic> downloadComplete(BuildContext context, String filePath) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
       return Scaffold(
          backgroundColor: Colors.transparent, // Background color similar to the image
          body: Center(
            child: Container(
              width: 300, // Width of the card
              padding: const EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15.0),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 10.0,
                    offset: Offset(0, 5),
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Align(
                    alignment: Alignment.topRight,
                    child: Icon(Icons.close, color: Colors.grey),
                  ),
                  const SizedBox(height: 10.0),
                  const Icon(Icons.picture_as_pdf_rounded),
                  const SizedBox(height: 20.0),
                  const Text(
                    'Your PDF File Is Downloaded',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 10.0),
                  const Text(
                    'Click the below button to View pdf or Downloads',
                    style: TextStyle(
                      fontSize: 14.0,
                      color: Colors.black54,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton.icon(
                        onPressed: () {
                          Navigator.pop(context);
                          Navigator.push(context, MaterialPageRoute(builder: (context) =>  PDFView(filePath: filePath)));
                        },
                        style: ElevatedButton.styleFrom(
                          // primary: const Color(0xFFF8B400), // Yellow color
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        icon: const Icon(Icons.remove_red_eye),
                        label: const Text('View PDF'),
                      ),
                      ElevatedButton.icon(
                        onPressed: () {
                          Navigator.pop(context);
                          Navigator.push(context, MaterialPageRoute(builder: (context) => Screenfactory.create('Downloads', '')));
                        },
                        style: ElevatedButton.styleFrom(
                          // primary: const Color(0xFF007BFF), // Blue color
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        icon: const Icon(Icons.download),
                        label: const Text('Downloads'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
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
