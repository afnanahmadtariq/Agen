
import 'package:agen/popUps.dart';
import 'package:agen/save.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

class HtmlView extends StatelessWidget {
  final String title;
  final String htmlContent;

  const HtmlView ({super.key, required this.htmlContent, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: HtmlWidget(
            htmlContent,
            renderMode: RenderMode.column,
            // customWidgetBuilder: (element) {
            //   if (element.localName == 'img') {
            //     // Extract image source (URL or data URI)
            //     String src = element.attributes['src']!;

            //     // If using data URI, decode and display image
            //     if (src.startsWith('data:')) {
            //       // Decode image data here (example using base64)
            //       Uint8List decodedData = base64.decode(src.split(',')[1]);

            //       // Return a custom widget displaying the image
            //       return Image.memory(decodedData);
            //     } else {
            //       // Use NetworkImage for images from URLs
            //       return Image.network(src);
            //     }
            //   }

            //   // Return null for other elements (default behavior)
            //   return null;
            // },
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
          onPressed: () async {
            Popups.loading(context);
            try {
              print('dab giya');
              await Save.downloadPdfFile(htmlContent, title);
              // ignore: use_build_context_synchronously
              Navigator.pop(context);
              // Show a success message to the user
            } catch (error) {
              // Handle download errors
              print('Error downloading PDF: $error');
            }
          }, 
          label: const Text("Download")
          ),
      ),
    );
  }
}
