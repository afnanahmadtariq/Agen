import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class HtmlDisplayScreen extends StatelessWidget {
  final String htmlContent;

  const HtmlDisplayScreen({super.key, required this.htmlContent});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Assignment'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Html(
                data: htmlContent,
                style: const {
                  // Optional styling for specific HTML elements
                  // Refer to flutter_html documentation for available styles
                },
              ),
              const SizedBox(
                height: 80,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(
          left: 16.0,
          right: 16.0,
          bottom: 16.0,
          
        ),
        child: FloatingActionButton.extended(
          backgroundColor: const Color.fromARGB(255, 30, 0, 255),
          foregroundColor: Colors.white,
          icon: const Icon(Icons.download),
          onPressed: (){
            
          }, 
          label: const Text("Download")
          ),
      ),
    );
  }
}
