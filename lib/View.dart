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
          child: Html(
            data: htmlContent,
            style: const {
              // Optional styling for specific HTML elements
              // Refer to flutter_html documentation for available styles
            },
          ),
        ),
      ),
    );
  }
}
