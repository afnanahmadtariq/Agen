import 'package:agen/View.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Generating Assignment'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min, // Center content vertically
          children: [
            const SizedBox(height: 24.0), // Add spacing

            // Text with progress indicator (replace with actual widget)
            const Text(
              'Your Assignment is under Process. It will be ready soon.',
              style: TextStyle(fontSize: 18.0),
            ),
            const SizedBox(height: 8.0), // Add spacing
            const CircularProgressIndicator(),

            const SizedBox(height: 24.0), // Add spacing

            // "Start Generating" button (adjust padding/color as needed)
            ElevatedButton(
              // ignore: avoid_print
              onPressed: () => print('Start Generating button pressed'),
              style: ElevatedButton.styleFrom(
                // primary: Colors.blue,
                padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
              ),
              child: const Text('Start Generating'),
            ),
          ],
        ),
      ),
    );
  }
}


// Future<void> invokeAzureFunction(String question) async {
//   // URL of your Azure Function
//   var functionUrl = 'http://localhost:7071/api/agen';
//   // var functionUrl = 'https://agen-func.azurewebsites.net';
  
  
//   // Parameters for the request
//   var params = {
//     "code": "",
//     "question": question
//   };
  
//   // Making a GET request to the Azure Function
//   var uri = Uri.parse(functionUrl);
//   var response = await http.get(uri.replace(queryParameters: params));
  
//   // Check if the request was successful
//   if (response.statusCode == 200) {
//     final htmlContent = response.body;
//     Navigator.push(
//       context,
//       MaterialPageRoute(
//         builder: (context) => HtmlDisplayScreen(htmlContent: htmlContent),
//       ),
//     );
//     // Save the response content to a text file
//     // File file = File('assignment.html');
//     // await file.writeAsString(response.body, encoding: utf8);
//     print("HTML content saved to assignment.html");
//     // Navigator.push(
//     //   context,
//     //   MaterialPageRoute(
//     //     builder: (context) => WebViewScreen(htmlContent: response.body),
//     //   ),
// // );

//   } 
//   else {
//     print("Failed to retrieve content. Status code: ${response.statusCode}");
//     print("Response: ${response.body}");
//   }
// }


// void main() {
//   String question = "What are the impacts of climate change on global agriculture?";
//   invokeAzureFunction(question);
// }
