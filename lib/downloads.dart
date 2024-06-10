import 'dart:io';
import 'package:agen/screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:path_provider/path_provider.dart';

  
class Downloads extends Screen{

  @override
  String label = 'Downloads';
  @override
  int index = 2;

  Downloads({super.key});

  @override
  Widget body(context) {
    return Scaffold(
      backgroundColor: Theme.of(context).cardColor,body: const DownloadItems());
  }

  @override
  info(context){
    infoPopUp(context, "You can view all downloaded assignments from this page.");
  }
  
}

class DownloadItems extends StatefulWidget{
  const DownloadItems({super.key});

  @override
    _DownloadItems  createState() => _DownloadItems();
}

class _DownloadItems extends State<DownloadItems>{
  var _isLoading= true;

  List<FileSystemEntity> pdfFiles = []; 
  Future<void> loadPdfFiles() async {
    final appDirectory = await getApplicationDocumentsDirectory();
    if (appDirectory != null) {
      print(appDirectory.toString());
      pdfFiles = await getPdfFilesInDirectory(appDirectory);
    }
    setState(() => _isLoading = false);
  }


  Future<List<FileSystemEntity>> getPdfFilesInDirectory(Directory directory) async {
    final files = await directory.list().where((file) => file.path.endsWith('.pdf')).toList();
    return files;
  }
  @override
  void initState() {
    super.initState();
    loadPdfFiles();
  }

  @override
  Widget build(BuildContext context){
    return _isLoading ? const Center(child: CircularProgressIndicator()) : 
      pdfFiles.isEmpty ? const Center( child: Text("No Downloads!")) :
        ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: pdfFiles.length,
        itemBuilder: (context, index) {
          String name = pdfFiles[index].toString();
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: DownloadItem(name.substring(name.lastIndexOf("/")+1,name.length-5),pdfFiles[index].toString()),
          );
        },
      );
  }
}

class DownloadItem extends StatelessWidget {
  final String fileName;
  final String filePath;

  const DownloadItem(this.fileName, this.filePath, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: GestureDetector(
        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) =>  PDFView(filePath: filePath))),
        child: ListTile(
          leading: Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: const Icon(Icons.download, color: Colors.black),
          ),
          title: const Text(
            'PDF File',
            style: TextStyle(
              color: Colors.orange,
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Text(fileName),
        ),
      ),
    );
  }
}
