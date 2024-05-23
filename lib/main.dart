import 'package:agen/Generator.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:theme_provider/theme_provider.dart';
import 'Template.dart';
import 'Generator.dart';

class ThemeProvider with ChangeNotifier {
  ThemeData _currentTheme = ThemeData.light();

  ThemeData get currentTheme => _currentTheme;

  void changeTheme(ThemeData newTheme) {
    _currentTheme = newTheme;
    notifyListeners(); 
  }
}
var template = 4;
final TextEditingController textController = TextEditingController();
void main() {
  runApp(ChangeNotifierProvider<ThemeProvider>(
      create: (_) => ThemeProvider(),
      child: MyApp(),
    ),);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        title: 'Agen',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFF0961F5)),
        ),
        home: HomePage(),
      ),
    );
  }
}

class MyAppState extends ChangeNotifier {
  var current = WordPair.random();
  void getNext() {
    current = WordPair.random();
    notifyListeners();
  }
}

class TopSpacer extends StatelessWidget {
  final double height; 
  const TopSpacer({Key? key, required this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: height);
  }
}

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  var selectedIndex = 0; 
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    var pair = appState.current;


    Widget page;
    switch (selectedIndex) {
      case 0:
        page = Generator();
      case 1:
        page = Placeholder();
      default:
        throw UnimplementedError('no widget for $selectedIndex');
    }

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text('This is Home page!  (To be implemented)'),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context, 
                  MaterialPageRoute(builder: (context) => showGenerator()),
                );
              }, 
                child: Text('View Templates'),
            ),
          ],
        ),
        ),
    );
  }
}

class BigCard extends StatelessWidget {
  const BigCard({
    super.key,
    required this.pair,
  });

  final WordPair pair;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context); 
     final style = theme.textTheme.displayMedium!.copyWith(
      color: theme.colorScheme.onPrimary,
    ); 
    return Card(
      color: theme.colorScheme.primary,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Text(pair.asLowerCase, style: style),
      ),
    );
  }
}

// class Template extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//           child: Padding(
//             padding: const EdgeInsets.all(12.0),
//             child: Column(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   IconButton(
//                     icon: Icon(Icons.arrow_back), 
//                     onPressed: () {
//                       Navigator.push(
//                         context, 
//                         MaterialPageRoute(builder: (context) => HomePage()),
//                       );
//                     },
//                   ),
//                   Text('Templates', style: TextStyle(
//                     fontSize: 16.0,
//                     fontWeight: FontWeight.bold,
//                   ),),
//                   IconButton(
//                     icon: Icon(Icons.info_outline), // Use info outline icon
//                     onPressed: () {
//                       infoDialogueGenerate(context);
//                       print("Info button pressed!");
//                     },
//                   ),
//                 ],
//               ),
//               Column(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceAround,
//                     children: [
//                       TemplateOption(text: 'Easy'),
//                       TemplateOption(text: 'Medium'),
//                     ],
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceAround,
//                     children: [
//                       TemplateOption(text: 'Complex'),
//                       TemplateOption(text: 'Blank'),
//                     ],
//                   ),
//                 ],
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceAround, 
//                 children: [
//                   IconButton(
//                     icon: Icon(Icons.home),
//                     onPressed: () {
//                       Navigator.push(
//                         context, 
//                         MaterialPageRoute(builder: (context) => HomePage()),
//                       );
//                     },
//                   ),
//                   IconButton(
//                     icon: Icon(Icons.edit_document),
//                     onPressed: () {
//                       Navigator.push(
//                         context, 
//                         MaterialPageRoute(builder: (context) => Courses()),
//                       );
//                     },
//                   ),
//                   IconButton(
//                     icon: Icon(Icons.download), 
//                     onPressed: () {
//                       Navigator.push(
//                         context, 
//                         MaterialPageRoute(builder: (context) => Downloads()),
//                       );
//                     },
//                   ),
//                   IconButton(
//                     icon: Icon(Icons.settings), 
//                     onPressed: () {
//                       Navigator.push(
//                         context, 
//                         MaterialPageRoute(builder: (context) => Settings()),
//                       );
//                     },
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// Future<dynamic> infoDialogueGenerate(BuildContext context) {
//     return showDialog(
//     context: context,
//     builder: (BuildContext context) {
//       return AlertDialog(
//         title: Text('Guide'),
//         content: Text('Select the template you want your assignment to be generated according to.'),
//         actions: [
//           TextButton(
//             onPressed: () {
//               Navigator.pop(context);
//             },
//             child: Text('Close'),
//           ),
//         ],
//       );
//     },
//   );
//   }
// }

// class TemplateOption extends StatelessWidget {
//   const TemplateOption({
//     super.key,
//     required this.text,
//   });
//   final String text;

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(5.0),
//       child: Card(
//         elevation: 5.0,
//         child: ElevatedButton(
//             onPressed: () {
//               // To be Implemented Module Template selection related to backend
//               switch (text) {
//                 case 'Easy':
//                   template = 1;
//                   break;
//                 case 'Medium':
//                   template = 2;
//                   break;
//                 case 'Complex':
//                   template = 3;
//                   break;
//                 case 'Blank':
//                   template = 4;
//                   break;
//                 default:
//                   template = 4;
//               }
//               Navigator.push(
//                 context, 
//                 MaterialPageRoute(builder: (context) => Generator()),
//               );
//               print('button pressed!');
//             },
//             style: ElevatedButton.styleFrom(
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(5.0), 
//                 ),
//             ),
//             child: SizedBox(
//               width: 95.0,
//               height: 95.0,
//               child: Center(
//                 child: Text(
//                   text, style: TextStyle(
//                     fontSize: 22.0,
//                     color: Colors.blue,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ),
//             ),
//         ),
//       ),
//     );
//   }
// }

class Courses extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back), 
                    onPressed: () {
                      Navigator.push(
                        context, 
                        MaterialPageRoute(builder: (context) => HomePage()),
                      );
                    },
                  ),
                  Text('Courses', style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),),
                  IconButton(
                    icon: Icon(Icons.info_outline), // Use info outline icon
                    onPressed: () {
                      infoDialogueGenerate(context);
                      print("Info button pressed!");
                    },
                  ),
                ],
              ),
              Text("This is Courses Page.  (To be implemented)"),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround, 
                children: [
                  IconButton(
                    icon: Icon(Icons.home),
                    onPressed: () {
                      Navigator.push(
                        context, 
                        MaterialPageRoute(builder: (context) => HomePage()),
                      );
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.edit_document),
                    onPressed: () {
                      Navigator.push(
                        context, 
                        MaterialPageRoute(builder: (context) => Courses()),
                      );
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.download), 
                    onPressed: () {
                      Navigator.push(
                        context, 
                        MaterialPageRoute(builder: (context) => Downloads()),
                      );
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.settings), 
                    onPressed: () {
                      Navigator.push(
                        context, 
                        MaterialPageRoute(builder: (context) => Settings()),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
Future<dynamic> infoDialogueGenerate(BuildContext context) {
    return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Guide'),
        content: Text('Select the course you want your assignment to be generated according to.'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('Close'),
          ),
        ],
      );
    },
  );
  }
}

class Downloads extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back), 
                    onPressed: () {
                      Navigator.push(
                        context, 
                        MaterialPageRoute(builder: (context) => HomePage()),
                      );
                    },
                  ),
                  Text('Downloads', style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),),
                  IconButton(
                    icon: Icon(Icons.info_outline), // Use info outline icon
                    onPressed: () {
                      infoDialogueGenerate(context);
                      print("Info button pressed!");
                    },
                  ),
                ],
              ),
              Text("This is Downloads (To be implemented) Page."),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround, 
                children: [
                  IconButton(
                    icon: Icon(Icons.home),
                    onPressed: () {
                      Navigator.push(
                        context, 
                        MaterialPageRoute(builder: (context) => HomePage()),
                      );
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.edit_document),
                    onPressed: () {
                      Navigator.push(
                        context, 
                        MaterialPageRoute(builder: (context) => Courses()),
                      );
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.download), 
                    onPressed: () {
                      Navigator.push(
                        context, 
                        MaterialPageRoute(builder: (context) => Downloads()),
                      );
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.settings), 
                    onPressed: () {
                      Navigator.push(
                        context, 
                        MaterialPageRoute(builder: (context) => Settings()),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
Future<dynamic> infoDialogueGenerate(BuildContext context) {
    return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Guide'),
        content: Text('You can view all downloaded assignments from this page.'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('Close'),
          ),
        ],
      );
    },
  );
  }
}

class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back), 
                    onPressed: () {
                      Navigator.push(
                        context, 
                        MaterialPageRoute(builder: (context) => HomePage()),
                      );
                    },
                  ),
                  Text('Settings', style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),),
                  IconButton(
                    icon: Icon(Icons.info_outline), // Use info outline icon
                    onPressed: () {
                      infoDialogueGenerate(context);
                      print("Info button pressed!");
                    },
                  ),
                ],
              ),
              Text("This is Settings Page.  (To be implemented)"),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround, 
                children: [
                  IconButton(
                    icon: Icon(Icons.home),
                    onPressed: () {
                      Navigator.push(
                        context, 
                        MaterialPageRoute(builder: (context) => HomePage()),
                      );
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.edit_document),
                    onPressed: () {
                      Navigator.push(
                        context, 
                        MaterialPageRoute(builder: (context) => Courses()),
                      );
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.download), 
                    onPressed: () {
                      Navigator.push(
                        context, 
                        MaterialPageRoute(builder: (context) => Downloads()),
                      );
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.settings), 
                    onPressed: () {
                      Navigator.push(
                        context, 
                        MaterialPageRoute(builder: (context) => Settings()),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
Future<dynamic> infoDialogueGenerate(BuildContext context) {
    return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Guide'),
        content: Text('You can view all settings from this page.'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('Close'),
          ),
        ],
      );
    },
  );
  }
}

class Generator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back), 
                    onPressed: () {
                      Navigator.push(
                        context, 
                        MaterialPageRoute(builder: (context) => showTemplates()),
                      );
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.info_outline), 
                    onPressed: () {
                      infoDialogueGenerate(context);
                      print("Info button pressed!");
                    },
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GeneratingMode(text: 'Extra Clever \nScraping'),
                  GeneratingMode(text: 'Fast And \nAccurate'),
                ],
              ),
              Column(
                children: [
                  SuggestionButton(text: "Load-shedding in Pakistan, and Government"),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SuggestionButton(text: "Global Warming"),
                      SuggestionButton(text: "Terrorism"),
                    ],
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: QueryBar(),
                  ),
                  GenerateButton(),
                ],
              ),
            ],
                    ),
          ),
      ),
    );
  }

  Future<dynamic> infoDialogueGenerate(BuildContext context) {
    return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Guide'),
        content: Text('Enter the prompt for generatingassignment or you can get started with the given suggestions.'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('Close'),
          ),
        ],
      );
    },
  );
  }
}

class GeneratingMode extends StatelessWidget {
  const GeneratingMode({
    super.key,
    required this.text,
  });
  final String text;

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return TextButton(
        onPressed: () {
          // To be Implemented Module
          themeProvider.changeTheme(ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 255, 0, 0),)));
          print('button pressed!');
        },
        child: Container(
        width: 100.0,
        height: 100.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0), // Set rounded corners
          border: Border.all(
            color: Colors.blue,
            width: 1.0,
          ),
        ),
        child: Center(
          child: Text(
            text, style: TextStyle(
              fontSize: 14.0,
              color: Colors.blue,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}

class SuggestionButton extends StatelessWidget {
  const SuggestionButton({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          textController.text = text;
          print('button pressed!');
        },
        child: Text(text),
      );
  }
}

class QueryBar extends StatelessWidget {
  const QueryBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textController,
      decoration: InputDecoration(
        hintText: "Enter query...",
        prefixIcon: Icon(Icons.search),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
      ),
    );
  }
}

class GenerateButton extends StatelessWidget {
  const GenerateButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context); 
    return IconButton(
      icon: Card(
        color: theme.primaryColor,
        margin: const EdgeInsets.all(0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        elevation: 5.0,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Icon(
            Icons.arrow_forward,
            color: Colors.white,
          ),
        )
      ),
      onPressed: () {
        // To be implemented Module (Data processing Module)
        print("Search button pressed!");
      },
    );
  }
}