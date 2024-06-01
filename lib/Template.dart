import 'package:agen/Generator.dart';
import 'package:agen/Screen.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Template extends Screen {
  Template({super.key});
  @override
  // ignore: overridden_fields
  String label = 'Select a Template';
  @override
  // ignore: overridden_fields
  int index = 2;

  @override
  Widget body(context){
    return Padding(
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
              Navigator.push(context, MaterialPageRoute(builder: (context) => Generator( "e"))); 
            },
          ),
          _buildTemplateOption(
            context,
            icon: Icons.edit,
            color: Colors.blue,
            label: 'Medium',
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => Generator('m'))); 
            },
          ),
          _buildTemplateOption(
            context,
            icon: Icons.playlist_play,
            color: Colors.blueAccent,
            label: 'Complex',
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => Generator('h'))); 
            },
          ),
          _buildTemplateOption(
            context,
            icon: Icons.insert_drive_file,
            color: Colors.black,
            label: 'Blank',
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => Generator('b'))); 
            },
          ),
        ],
      ),
    );
  }
  @override
  info(context){
    infoPopUp(context, "Select the template you want your assignment to be generated according to.");
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

