import 'dart:io';

import 'package:agen/html_view.dart';
import 'package:agen/popUps.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<void> generateAssignment(String question, String template, String course, context) async {
  //Commented lines for dev of web app
  // await dotenv.load(fileName: ".env"); // Load variables from .env file
  // print('Loaded environment variables: ${dotenv.env}');
  // final azureFunctionCode = dotenv.env['AZURE_FUNCTION_CODE'];
  final azureFunctionCode = Platform.environment['AZURE_FUNCTION_CODE'];
  //Commented lines for dev of andriod app
  
  
  // // Parameters for the request
  var params = {
    "code": azureFunctionCode,
    "question": question,
    "template": template,
    "course": course,
  };
  var uri = Uri.https('agen-func.azurewebsites.net', '/api/agen', params);
  // final uri = Uri.parse(functionUrl).replace(queryParameters: params);

  try {
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      String title = response.headers['title']!;
      Navigator.pop(context);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => HtmlView(htmlContent: response.body, title : title),
        ),
      );
    } 
    else {
      print("Failed to retrieve content. Status code: ${response.statusCode}");
      print("Response: ${response.body}");
    }
  } 
  catch (error) {
    Popups.error(context);
    // Handle parsing or other errors
    print("Error fetching data: $error");
  }
}