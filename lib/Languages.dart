// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart'; // Import for SVG icons

class Languages extends StatefulWidget {
  const Languages({super.key});

  @override
  _LanguagesState createState() => _LanguagesState();
}

class _LanguagesState extends State<Languages> {
  String _currentLanguage = 'English (US)'; // Placeholder, initial language

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Language'),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20.0), // Adjust padding as needed
        child: Column(
          children: [
            // Language List with SVG Flags
            _buildLanguageList(),

            // Divider
            Divider(thickness: 1.0, color: Colors.grey[300]),

            // "Done" Button
            TextButton(
              onPressed: () {
                // Handle "Done" button action (save selection)
              },
              child: Text(
                'Done',
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize: 16.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget to build the language list with SVG flags
  Widget _buildLanguageList() {
    List<Map<String, dynamic>> languages = [
      // Example language data (replace with your actual languages)
      {
        'name': 'English (US)',
        'code': 'en_US',
        'flagAsset': 'assets/flags/us.svg', // Path to your SVG flag asset
      },
      {
        'name': 'English (UK)',
        'code': 'en_UK',
        'flagAsset': 'assets/flags/uk.svg',
      },
      // Add more languages here
    ];

    return ListView.builder(
      shrinkWrap: true, // Wrap content vertically
      physics: const NeverScrollableScrollPhysics(), // Disable scrolling
      itemCount: languages.length,
      itemBuilder: (context, index) {
        final language = languages[index];
        return RadioListTile<String>(
          title: Row(
            children: [
              SvgPicture.asset(
                language['flagAsset'], // Load SVG flag
                width: 24.0,
                height: 16.0,
              ),
              const SizedBox(width: 10.0),
              Text(language['name']),
            ],
          ),
          value: language['code'],
          groupValue: _currentLanguage,
          onChanged: (val) => setState(() => _currentLanguage = val!),
        );
      },
    );
  }
}
