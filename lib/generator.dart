// ignore_for_file: must_be_immutable
import 'package:agen/screen.dart';
import 'package:agen/api.dart';
import 'package:flutter/material.dart';

final TextEditingController _controller = TextEditingController();
final navigatorKey = GlobalKey<NavigatorState>();

class Generator extends Screen{
  @override
  String label = "Generator";
  final String course;
  final String template;
  
  Generator({super.key, required this.course, required this.template});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: appBar(context),
      body: body(context),
      bottomSheet: bottom(context)
    );
  }

  @override
  info(context){
    infoPopUp(context, "Enter the prompt for generating assignment or you can get started with the given suggestions.");
  }
  @override
  Widget body(context){
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              FeatureButton(
                icon: Icons.emoji_objects,
                label: 'Extra Clever Scraping',
              ),
              FeatureButton(
                icon: Icons.flash_on,
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
    );
  }
  @override
  Widget bottom(context) {
    return Padding(
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
              if(_controller.text.isNotEmpty){
                loading(context);
                generateAssignment(_controller.text, template, course, context);
              }
              else{
                warnning(context);
              }
            },
            child: const Icon(Icons.arrow_upward),
          ),
        ],
      ),
    );
  }
  Future<dynamic> warnning(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Warnning!', textAlign: TextAlign.center,),
          content: const Text('Please write some topic to generate Assignment!', textAlign: TextAlign.center,),
          actions: [
            Center(
              child: TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Close'),
              ),
            ),
          ],
        );
      },
    );
  }
 
  Future<dynamic> loading(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return Scaffold(
          backgroundColor: Colors.transparent,
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
                        fontFamily: 'Roboto',
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
      },
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
