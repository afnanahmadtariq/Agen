import 'package:agen/Courses.dart';
import 'package:agen/Downloads.dart';
import 'package:agen/ScreenFactory.dart';
import 'package:agen/Settings.dart';
import 'package:agen/main.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Screen extends StatelessWidget {
  String label = "page";
  int index = 0;

  Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(label),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.info_outline),
            onPressed: () {
              info(context);
            },
          ),
        ],
      ),
      body: body(context),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index, // The current index
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
              Navigator.push(context, MaterialPageRoute(builder: (context) => Screenfactory.create('Courses')));
              break;
            case 2:
              Navigator.push(context, MaterialPageRoute(builder: (context) => Screenfactory.create('Downloads')));
              break;
            case 3:
              Navigator.push(context, MaterialPageRoute(builder: (context) => const Settings()));
              break;
          }
        },
      ),
    );
  }
  Widget body(context) {
    return this;
  }
  info(context){
    infoPopUp(context, "Something");
  }
  Future<dynamic> infoPopUp(BuildContext context, String text) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Guide'),
          content: Text(text),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }
}
