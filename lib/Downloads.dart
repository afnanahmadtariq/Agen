import 'package:agen/Screen.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Downloads extends Screen {
  final List<String> downloadItems = List<String>.generate(6, (index) => 'Global Warming In India');


  @override
  // ignore: overridden_fields
  String label = 'Downloads';
  @override
  // ignore: overridden_fields
  int index = 2;

  Downloads({super.key});

  @override
  Widget body(context){
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemCount: downloadItems.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: DownloadItem(downloadItems[index]),
        );
      },
    );
  }

  @override
  info(context){
    infoPopUp(context, "You can view all downloaded assignments from this page.");
  }
}

class DownloadItem extends StatelessWidget {
  final String fileName;

  const DownloadItem(this.fileName, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
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
    );
  }
}
