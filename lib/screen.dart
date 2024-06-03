import 'package:agen/settings.dart';
import 'package:agen/main.dart';
import 'package:agen/screen_factory.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Screen extends StatelessWidget {
  String label = "page";
  int index = -1;

  Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: appBar(context),
      body: body(context),
      bottomNavigationBar: bottom(context)
    );
  }
  PreferredSizeWidget appBar(context){
    return AppBar(
      title: Text(label),
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
      elevation: 0,
      actions: [
        IconButton(
          icon: const Icon(Icons.info_outline),
          onPressed: () {
            info(context);
          },
        ),
      ],
    );
  }
  Widget body(context) {
    return this;
  }
  Widget bottom(context){
    var selectedItemColor = Colors.blue;
    if (index == -1){
      selectedItemColor = Colors.grey;
      index = 0;
    }
    return BottomNavigationBar(
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
      currentIndex: index,
      selectedItemColor: selectedItemColor,
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
    );
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
