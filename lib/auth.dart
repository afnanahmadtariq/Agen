import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Firebase Auth',
      home: SignInScreen(),
    );
  }
}

class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> signInWithGoogle() async {
    // Implement your sign-in logic using Google or any other provider
    // Example for anonymous sign-in
    UserCredential userCredential = await _auth.signInAnonymously();
    print('Signed in: ${userCredential.user?.uid}');
  }

  Future<void> sendRequestToFunction() async {
    User? user = _auth.currentUser;
    if (user != null) {
      String idToken = (await user.getIdToken()) as String;

      final response = await http.post(
        Uri.parse('https://<YOUR_AZURE_FUNCTION_URL>'),
        headers: {
          'Authorization': 'Bearer $idToken',
        },
      );

      if (response.statusCode == 200) {
        print('Success: ${response.body}');
      } else {
        print('Error: ${response.statusCode}');
      }
    } else {
      print('Error: User is not signed in');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Firebase Auth'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            await signInWithGoogle();
            await sendRequestToFunction();
          },
          child: Text('Sign In and Send Request'),
        ),
      ),
    );
  }
}
