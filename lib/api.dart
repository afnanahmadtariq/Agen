// import 'dart:convert';
// import 'package:http/http.dart' as http;

// void main() async {
//   // Replace with your actual Azure Function details
//   var url = Uri.https('assgen-func.azurewebsites.net', '/api/test', {
//     'name': 'Bob'
//   });

//   var headers = {
//     'Authentication': 'Bearer Token',
//     '':'',
//   };

//   // Send a GET request (adjust method and data if needed)
//   var response = await http.get(url, headers: headers);

//   print('Status code: ${response.statusCode}');
//   print('Content-Type: ${response.headers['content-type']}');

//   // Check for successful response
//   if (response.statusCode == 200) {
//     print('Success! Response: ${response.body}');
//   } else {
//     print('Error: ${response.statusCode} ${response.body}');
//   }
// }


// import 'dart:convert';
// import 'package:http/http.dart' as http;

// void main() async {
//   // Constructing the URL with query parameters
//   var url = Uri.https('assgen-func.azurewebsites.net', '/api/test', {
//     'name': 'Bob'
//   });

//   // Defining headers
//   var headers = {
//     'Authentication': 'Bearer Token',
//     'Accept': 'application/json',
//   };

//   try {
//     // Send a GET request with a timeout
//     var response = await http.get(url, headers: headers).timeout(Duration(seconds: 10));

//     // Handling the response
//     if (response.statusCode == 200) {
//       print('Success! Response: ${response.body}');
//       // If the response is JSON, decode it
//       var jsonResponse = jsonDecode(response.body);
//       print('Decoded JSON: $jsonResponse');
//     } else {
//       print('Error: ${response.statusCode} ${response.reasonPhrase}');
//     }
//   } on http.ClientException catch (e) {
//     // Handle client-side errors, such as invalid URL, connectivity issues, etc.
//     print('Client exception: $e');
//   } on http.Response catch (e) {
//     // Handle specific HTTP response errors if needed
//     print('Response exception: $e');
//   // } on TimeoutException catch (e) {
//   //   // Handle timeout exceptions
//   //   print('Request timed out: $e');
//   } catch (e) {
//     // Handle any other exceptions
//     print('Unexpected error: $e');
//   }
// }


//Pinggggggggggg
import 'dart:async';

import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

Future<void> send() async {
  // Construct the URL with query parameters
  var url = Uri.https('assgen-func.azurewebsites.net', '/api/test', {
    'name': 'Bob'
  });

  // Define headers (if necessary)
  var headers = {
    'Authentication': 'Bearer Token',
    'Accept': 'application/octet-stream',  // Indicate that we're expecting a binary file
    'Question':'',
  };

  try {
    // Send a GET request
    var response = await http.get(url, headers: headers);

    // Check for successful response
    if (response.statusCode == 200) {
      // Get the directory to save the file
      var directory = await getApplicationDocumentsDirectory();
      var filePath = '${directory.path}/downloaded_file.ext';

      // Write the file to disk
      var file = File(filePath);
      await file.writeAsBytes(response.bodyBytes);

      print('File saved to: $filePath');
    } else {
      print('Error: ${response.statusCode} ${response.reasonPhrase}');
    }
  } catch (e) {
    print('An error occurred: $e');
  }
}












//INvokeeeeeeee

Future<void> main() async {
  // Call the fetchFile function
  var file = await fetchFile();

  // Check if file is not null
  print('File fetched successfully: ${file.path}');
  // Do something with the fetched file
}

Future<File> fetchFile() async {
  // Simulate fetching a file asynchronously
  await Future.delayed(Duration(seconds: 2));
  
  // For demonstration purposes, return a File object (you would replace this with your actual file-fetching logic)
  return File('/path/to/fetched/file.txt');
}







//HTMLLLLLLLLLLLL
// try {
//   // Send a GET request
//   var response = await http.get(url, headers: headers);

//   // Check for successful response
//   if (response.statusCode == 200) {
//     // Get the HTML content
//     var htmlContent = response.body;

//     // Print or use the HTML content as needed
//     print('HTML content received: $htmlContent');
    
//     // Now you can process or display the HTML content as needed
//     // For example, you can render it in a WebView or parse it using a library like Flutter HTML
//   } else {
//     print('Error: ${response.statusCode} ${response.reasonPhrase}');
//   }
// } catch (e) {
//   print('An error occurred: $e');
// }
