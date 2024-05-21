import 'package:agen/main.dart';
import 'package:flutter/material.dart';

Widget showTemplates() {
  return Template();
}

class Template extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Template Selector',
      home: TemplateSelector(),
    );
  }
}

class TemplateSelector extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select a Template'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
                  context, 
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.info_outline),
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
                // Handle Easy template selection
              },
            ),
            _buildTemplateOption(
              context,
              icon: Icons.edit,
              color: Colors.blue,
              label: 'Medium',
              onTap: () {
                // Handle Medium template selection
              },
            ),
            _buildTemplateOption(
              context,
              icon: Icons.playlist_play,
              color: Colors.blueAccent,
              label: 'Complex',
              onTap: () {
                // Handle Complex template selection
              },
            ),
            _buildTemplateOption(
              context,
              icon: Icons.insert_drive_file,
              color: Colors.black,
              label: 'Blank',
              onTap: () {
                // Handle Blank template selection
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
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
            SizedBox(height: 10),
            Text(label, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}
