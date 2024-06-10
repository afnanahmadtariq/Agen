import 'package:agen/theme-data.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';
import 'theme_provider.dart';

class ThemePage extends StatefulWidget {
  const ThemePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ThemePageState createState() => _ThemePageState();
}


class _ThemePageState extends State<ThemePage> {
  bool _lightTheme = false;
  bool _darkTheme = false;
  bool _blueTheme = true;
  bool _pinkTheme = false;
  bool _amberTheme = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Change Theme'),
      ),
      body: ListView(
        children: [
          SwitchListTile(
            title: const Text('Light Theme'),
            value: _lightTheme,
            onChanged: (val) {
              Provider.of<ThemeProvider>(context, listen: false).toggleTheme(0);
              setState(() { 
                setTheme(0);
              });
            },
          ),
          SwitchListTile(
            title: const Text('Dark Theme'),
            value: _darkTheme,
            onChanged: (val) {
              Provider.of<ThemeProvider>(context, listen: false).toggleTheme(1);
              setState(() { 
                setTheme(1);
              });
            },
          ),
          SwitchListTile(
            title: const Text('Blue Theme'),
            value: _blueTheme,
            onChanged: (val) {
              Provider.of<ThemeProvider>(context, listen: false).toggleTheme(2);
              setState(() { 
                setTheme(2);
              });
            },
          ),
          SwitchListTile(
            title: const Text('Pink Theme'),
            value: _pinkTheme,
            onChanged: (val) {
              Provider.of<ThemeProvider>(context, listen: false).toggleTheme(3);
              setState(() { 
                setTheme(3);
              });
            },
          ),
          SwitchListTile(
            title: const Text('Amber Theme'),
            value: _amberTheme,
            onChanged: (val) {
              Provider.of<ThemeProvider>(context, listen: false).toggleTheme(4);
              setState(() { 
                setTheme(4);
              });
            },
          ),
        ],
      ),
    );
  }
  
  void setTheme(int index) {
    setState(() {
      _lightTheme = false;
      _darkTheme = false;
      _blueTheme = false;
      _pinkTheme = false;
      _amberTheme = false;
      switch(index){
      case 0:
        _lightTheme  = true;
        break;
      case 1:
        _darkTheme  = true;
        break;
      case 2:
        _blueTheme  = true;
        break;
      case 3:
        _pinkTheme  = true;
        break;
      case 4:
        _amberTheme  = true;
        break;
    }
    });
  }
}
