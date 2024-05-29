import 'package:agen/Courses.dart';
import 'package:agen/Downloads.dart';
import 'package:agen/Settings.dart';
import 'package:agen/main.dart';
import 'package:flutter/material.dart';
import 'Generator.dart';

Widget showTemplates() {
  return const Template();
}

class Template extends StatelessWidget {
  const Template({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Template Selector',
      home: TemplateSelector(),
    );
  }
}

class TemplateSelector extends StatelessWidget {
  const TemplateSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select a Template'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () { Navigator.push(context, MaterialPageRoute(builder: (context) => Courses()),); },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.info_outline),
            onPressed: () {
              // Implement info action
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 16.0,
          mainAxisSpacing: 16.0,
          children: <Widget>[
            _buildTemplateOption(
              context,
              icon: Icons.assignment,
              color: Colors.red,
              label: 'Easy',
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const Generator())); 
                // Handle Easy template selection
              },
            ),
            _buildTemplateOption(
              context,
              icon: Icons.edit,
              color: Colors.blue,
              label: 'Medium',
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const Generator())); 
                // Handle Medium template selection
              },
            ),
            _buildTemplateOption(
              context,
              icon: Icons.playlist_play,
              color: Colors.blueAccent,
              label: 'Complex',
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const Generator())); 
                // Handle Complex template selection
              },
            ),
            _buildTemplateOption(
              context,
              icon: Icons.insert_drive_file,
              color: Colors.black,
              label: 'Blank',
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const Generator())); 
                // Handle Blank template selection
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        // currentIndex: -1, // The current index
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.folder),
            label: 'Courses',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.download),
            label: 'Downloads',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          switch (index) {
            case 0:
              Navigator.push(context, MaterialPageRoute(builder: (context) => const HomePage()));
              break;
            case 1:
              Navigator.push(context, MaterialPageRoute(builder: (context) => Courses()));
              break;
            case 2:
              Navigator.push(context, MaterialPageRoute(builder: (context) => Downloads()));
              break;
            case 3:
              Navigator.push(context, MaterialPageRoute(builder: (context) => Settings()));
              break;
          }
        },
      ),
    );
  }

  Widget _buildTemplateOption(BuildContext context,
      {required IconData icon,
      required Color color,
      required String label,
      required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 5,
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(icon, size: 50, color: color),
            const SizedBox(height: 10),
            Text(label, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}
