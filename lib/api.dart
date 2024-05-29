import 'dart:convert';
import 'package:agen/Generator.dart';
import 'package:agen/View.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:io';



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
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text('Generating Assignment'),
      ),
      body: const Center(
        child: Column(
          mainAxisSize: MainAxisSize.min, // Center content vertically
          children: [
            SizedBox(height: 24.0), // Add spacing

            // Text with progress indicator (replace with actual widget)
            Text(
              'Your Assignment is under Process. It will be ready soon.',
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(height: 8.0), // Add spacing
            CircularProgressIndicator(),

            SizedBox(height: 24.0), // Add spacing
          ],
        ),
      ),
    );
  }
}

Future<void> invokeAzureFunction(String question, context) async {
  final azureFunctionCode = Platform.environment['AZURE_FUNCTION_CODE'];
  const functionUrl = 'https://agen-func.azurewebsites.net/api/agen';
  
  
  // // Parameters for the request
  var params = {
    "code": azureFunctionCode,
    "question": question
  };
  
   final uri = Uri.parse(functionUrl).replace(queryParameters: params);

  // Make a GET request with the encoded URL
  final response = await http.get(uri);
  
  // Check if the request was successful
  if (response.statusCode == 200) {
    print("HTML content saved to assignment.html");
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => HtmlDisplayScreen(htmlContent: response.body),
      ),
);

  } 
  else {
    print("Failed to retrieve content. Status code: ${response.statusCode}");
    print("Response: ${response.body}");
  }
}