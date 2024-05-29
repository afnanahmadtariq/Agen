import 'package:flutter/material.dart';
// For Timer

class GuidePopups extends StatefulWidget {
  const GuidePopups({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _GuidePopupsState createState() => _GuidePopupsState();
}

class _GuidePopupsState extends State<GuidePopups> {
  int _currentIndex = 0;
  final List<String> _popupTitles = [
    'Select the course you related to your assignment',
    'Select the templet according to your preference',
    'Enter Prompt and Download',
  ];

  @override
  void initState() {
    super.initState();
    // Start a timer to automatically navigate after a delay
    Future.delayed(const Duration(seconds: 5), () {
      if (_currentIndex < _popupTitles.length - 1) {
        setState(() => _currentIndex++);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.3), // Background color
      body: Center(
        child: Material(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.0),
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisSize: MainAxisSize.min, // Content fits screen
              children: [
                Image.asset(
                  'assets/guide_image.png', // Replace with your image asset
                  width: 100.0,
                  height: 100.0,
                ),
                const SizedBox(height: 16.0), // Add spacing
                Text(
                  _popupTitles[_currentIndex],
                  style: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16.0), // Add spacing
                TextButton(
                  onPressed: () {
                    if (_currentIndex < _popupTitles.length - 1) {
                      setState(() => _currentIndex++);
                    } else {
                      Navigator.pop(context); // Close the last popup
                    }
                  },
                  child: const Text('Next'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
