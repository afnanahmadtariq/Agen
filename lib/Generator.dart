// import 'package:flutter/material.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         // This is the theme of your application.
//         //
//         // TRY THIS: Try running your application with "flutter run". You'll see
//         // the application has a purple toolbar. Then, without quitting the app,
//         // try changing the seedColor in the colorScheme below to Colors.green
//         // and then invoke "hot reload" (save your changes or press the "hot
//         // reload" button in a Flutter-supported IDE, or press "r" if you used
//         // the command line to start the app).
//         //
//         // Notice that the counter didn't reset back to zero; the application
//         // state is not lost during the reload. To reset the state, use hot
//         // restart instead.
//         //
//         // This works for code too, not just values: Most code changes can be
//         // tested with just a hot reload.
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//         useMaterial3: true,
//       ),
//       home: const MyHomePage(title: 'Flutter Demo Home Page'),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});

//   // This widget is the home page of your application. It is stateful, meaning
//   // that it has a State object (defined below) that contains fields that affect
//   // how it looks.

//   // This class is the configuration for the state. It holds the values (in this
//   // case the title) provided by the parent (in this case the App widget) and
//   // used by the build method of the State. Fields in a Widget subclass are
//   // always marked "final".

//   final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;

//   void _incrementCounter() {
//     setState(() {
//       // This call to setState tells the Flutter framework that something has
//       // changed in this State, which causes it to rerun the build method below
//       // so that the display can reflect the updated values. If we changed
//       // _counter without calling setState(), then the build method would not be
//       // called again, and so nothing would appear to happen.
//       _counter++;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     // This method is rerun every time setState is called, for instance as done
//     // by the _incrementCounter method above.
//     //
//     // The Flutter framework has been optimized to make rerunning build methods
//     // fast, so that you can just rebuild anything that needs updating rather
//     // than having to individually change instances of widgets.
//     return Scaffold(
//       appBar: AppBar(
//         // TRY THIS: Try changing the color here to a specific color (to
//         // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
//         // change color while the other colors stay the same.
//         backgroundColor: Theme.of(context).colorScheme.inversePrimary,
//         // Here we take the value from the MyHomePage object that was created by
//         // the App.build method, and use it to set our appbar title.
//         title: Text(widget.title),
//       ),
//       body: Center(
//         // Center is a layout widget. It takes a single child and positions it
//         // in the middle of the parent.
//         child: Column(
//           // Column is also a layout widget. It takes a list of children and
//           // arranges them vertically. By default, it sizes itself to fit its
//           // children horizontally, and tries to be as tall as its parent.
//           //
//           // Column has various properties to control how it sizes itself and
//           // how it positions its children. Here we use mainAxisAlignment to
//           // center the children vertically; the main axis here is the vertical
//           // axis because Columns are vertical (the cross axis would be
//           // horizontal).

//           //
//           // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
//           // action in the IDE, or press "p" in the console), to see the
//           // wireframe for each widget.
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             const Text(
//               'You have clicked the button this many times:',
//             ),
//             Text(
//               '$_counter',
//               style: Theme.of(context).textTheme.headlineMedium,
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: const Icon(Icons.add),
//       ), // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }

import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
        home: Template(),
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
  const TopSpacer({super.key, required this.height});

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: height);
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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

    return Template();
    // return Scaffold(
      
    //   body: Column(
    //     children: [
    //       TopSpacer(height: 30.0),
    //       Row(
    //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //         children: [
    //           // Display the first image
    //           // Image.asset('images/Icon.jpg'), // Replace with your image path
    //           // SizedBox(width: 10.0), // Add spacing between images

    //           // Info button with right image
    //           IconButton(
    //             icon: Icon(Icons.info_outline), // Use info outline icon
    //             onPressed: () {
    //               // Handle info button press action
    //               // You can add functionality here, like showing a dialog with info
    //               print("Info button pressed!");
    //             },
    //           ),
    //         ],
    //       ),

    //       Text('A random idea:'),
    //       BigCard(pair: pair),
    //       ElevatedButton(
    //         onPressed: () {
    //           appState.getNext();
    //           print('button pressed o yeah!');
    //         },
    //         child: Text('Next'),
    //       ),
    //       Row(
    //         children: [
    //           // Search bar widget
    //           Expanded(
    //             child: TextField(
    //               decoration: InputDecoration(
    //                 hintText: "Enter query...",
    //                 prefixIcon: Icon(Icons.search),
    //                 border: OutlineInputBorder(
    //                   borderRadius: BorderRadius.circular(10.0),
    //                 ),
    //               ),
    //             ),
    //           ),
    //           // Button with arrow icon
    //           IconButton(
    //             icon: Icon(Icons.arrow_forward),
    //             onPressed: () {
    //               // Handle button press action
    //               // You can add functionality here, like starting a search
    //               print("Search button pressed!");
    //             },
    //           ),
    //         ],
    //       ),
    //     ],
    //   ),
    // );
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



class Template extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // TopSpacer(height: 30.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  // Display the first image
                  // Image.asset('images/Icon.jpg'), // Replace with your image path
                  // SizedBox(width: 10.0), // Add spacing between images
            
                  IconButton(
                    icon: Icon(Icons.info_outline), // Use info outline icon
                    onPressed: () {
                      infoDialogueGenerate(context);
                      print("Info button pressed!");
                    },
                  ),
                ],
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      TemplateOption(text: 'Easy'),
                      TemplateOption(text: 'Medium'),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      TemplateOption(text: 'Complex'),
                      TemplateOption(text: 'Blank'),
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
        content: Text('Select the template you want your assignment to be generated according to.'),
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
class TemplateOption extends StatelessWidget {
  const TemplateOption({
    super.key,
    required this.text,
  });
  final String text;

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {
          // To be Implemented Module
          switch (text) {
            case 'Easy':
              template = 1;
            case 'Medium':
              template = 2;
            case 'Complex':
              template = 3;
            case 'Blank':
              template = 4;
            default:
              template = 4;
          }

          print('button pressed!');
        },
        child: Container(
        width: 120.0,
        height: 120.0,
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
              // TopSpacer(height: 30.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  // Display the first image
                  // Image.asset('images/Icon.jpg'), // Replace with your image path
                  // SizedBox(width: 10.0), // Add spacing between images
            
                  IconButton(
                    icon: Icon(Icons.info_outline), // Use info outline icon
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