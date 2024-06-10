import 'package:agen/screen.dart';
import 'package:agen/screen_factory.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Courses extends Screen {
  final List<Map<String, dynamic>> courses = [
    {"name": "Math", "icon": Icons.calculate, "color": Colors.orange},
    {"name": "History", "icon": Icons.account_balance, "color": Colors.green},
    {"name": "Computer", "icon": Icons.computer, "color": Colors.blue},
    {"name": "Science", "icon": Icons.science, "color": Colors.blueAccent},
    {"name": "Economics", "icon": Icons.account_balance_wallet, "color": Colors.indigo},
    {"name": "Biology", "icon": Icons.biotech, "color": Colors.brown},
    {"name": "Physics", "icon": Icons.functions, "color": Colors.black},
    {"name": "Misc", "icon": Icons.category, "color": Colors.grey},
  ];

  Courses({super.key});
  @override
  // ignore: overridden_fields
  String label = 'Select a Course';
  @override
  // ignore: overridden_fields
  int index = 1;

  @override
  Widget body(context){
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          TextField(
            decoration: InputDecoration(
              hintText: 'Search for..',
              prefixIcon: const Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 1,
              ),
              itemCount: courses.length,
              itemBuilder: (context, index) {
                return CourseButton(
                  courses[index]['name'],
                  icon: courses[index]['icon'],
                  label: courses[index]['name'],
                  color: courses[index]['color'],
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  info(context){
    infoPopUp(context, "Select the course you want your assignment to be generated according to.");
  }
}

class CourseButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;
  var course;

  CourseButton(String c, {super.key, required this.icon, required this.label, required this.color}){
    course = c;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => Screenfactory.create('Template', course)));
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10,
              offset: Offset(0, 5),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 50, color: color),
            const SizedBox(height: 8),
            Text(
              label,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
