
import 'package:agen/api.dart';
import 'package:agen/View.dart';
import 'package:flutter/material.dart';

Widget showGenerator() {
  return const MyApp();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Generator(),
    );
  }
}

class Generator extends StatelessWidget {
  const Generator({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading:  Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset('assets/logo.png',), // Replace with your logo asset
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.info_outline, color: Colors.blue),
            onPressed: () {
              // Info button action
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FeatureButton(
                  icon: Icons.emoji_objects, // Corrected icon name
                  label: 'Extra Clever Scraping',
                ),
                FeatureButton(
                  icon: Icons.flash_on, // Corrected icon name
                  label: 'Fast And Accurate',
                ),
              ],
            ),
            const SizedBox(height: 40),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              alignment: WrapAlignment.center,
              children: [
                CustomButton(
                  label: 'Load-shedding in Pakistan, now',
                  onPressed: () {
                    // Button action
                  },
                ),
                CustomButton(
                  label: 'Global Warming',
                  onPressed: () {
                    // Button action
                  },
                ),
                CustomButton(
                  label: 'Terrorism',
                  onPressed: () {
                    // Button action
                  },
                ),
              ],
            ),
            const Spacer(),
            Row(
              children: [
                const Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Start generating...',
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                FloatingActionButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const HtmlDisplayScreen(htmlContent: 'ok',)));
                  },
                  child: const Icon(Icons.arrow_upward),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class FeatureButton extends StatelessWidget {
  final IconData icon;
  final String label;

  const FeatureButton({
    super.key,
    required this.icon,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        // primary: Colors.white,
        // onPrimary: Colors.black,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        side: BorderSide(color: Colors.grey.shade300),
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
      ),
      onPressed: () {
        // Feature button action
      },
      child: Column(
        children: [
          Icon(icon, size: 40, color: Colors.blue),
          const SizedBox(height: 8),
          Text(label, textAlign: TextAlign.center),
        ],
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;

  const CustomButton({
    super.key,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        // primary: Colors.grey.shade200,
        // onPrimary: Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
      ),
      onPressed: () {
        onPressed(); // Call the provided callback function
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Button clicked: $label'),
            duration: const Duration(milliseconds: 1500), // Display for 1.5 seconds
          ),
        );
      },
      child: Text(label),
    );
  }
}
