import 'package:agen/api.dart';
import 'package:agen/main.dart';
import 'package:flutter/material.dart';

final TextEditingController _controller = TextEditingController();
final navigatorKey = GlobalKey<NavigatorState>();

class Generator extends StatelessWidget {
  const Generator({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading:  GestureDetector(
          onTap: () { Navigator.push(context, MaterialPageRoute(builder: (context) => const HomePage()));},
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Image.asset('assets/logo.png',), // Replace with your logo asset
          ),
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
            const SizedBox(height: 120),
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
            
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
                children: [
                   Expanded(
                    child: TextField(
                    controller: _controller,
                      decoration: const InputDecoration(
                        hintText: 'Start generating...',
                        border: OutlineInputBorder(),
                        contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  FloatingActionButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const Loading()));
                      invokeAzureFunction(_controller.text, context);
                    },
                    child: const Icon(Icons.arrow_upward),
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
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 10.0),
      ),
      onPressed: () {
        // Feature button action
      },
      child: Column(
        children: [
          Icon(icon, size: 50, color: Colors.blue),
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
        _controller.text = label;
      },
      child: Text(label),
    );
  }
}
