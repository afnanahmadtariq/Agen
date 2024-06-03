import 'dart:io';
import 'package:agen/view.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

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
        child: GeneratingAssignmentScreen()
      ),
    );
  }
}

class GeneratingAssignmentScreen extends StatelessWidget {
  const GeneratingAssignmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[400],
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            width: 300,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 20),
                Icon(Icons.auto_awesome, size: 100, color: Colors.blue),
                SizedBox(height: 20),
                Text(
                  'Generating Assignment',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Your Assignment is under Process. It will be ready soon.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 20),
                CircularProgressIndicator(),
                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Future<void> invokeAzureFunction(String question,String template, context) async {
  final azureFunctionCode = Platform.environment['AZURE_FUNCTION_CODE'];
  const functionUrl = 'https://agen-func.azurewebsites.net/api/agen';
  
  
  // // Parameters for the request
  var params = {
    "code": azureFunctionCode,
    "question": question,
    "template": template,
  };
  final uri = Uri.parse(functionUrl).replace(queryParameters: params);

  try {
    final response = await http.get(uri);

    if (response.statusCode == 200) {
    print("HTML content received");
      Navigator.pop(context);
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
  catch (error) {
    // Handle parsing or other errors
    print("Error fetching data: $error");
  }
}