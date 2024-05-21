// import 'package:english_words/english_words.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// class ThemeProvider with ChangeNotifier {
//   ThemeData _currentTheme = ThemeData.light();

//   ThemeData get currentTheme => _currentTheme;

//   void changeTheme(ThemeData newTheme) {
//     _currentTheme = newTheme;
//     notifyListeners(); 
//   }
// }
// var template = 4;
// final TextEditingController textController = TextEditingController();

// class Generator extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//           child: Padding(
//             padding: const EdgeInsets.all(12.0),
//             child: Column(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               // TopSpacer(height: 30.0),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.end,
//                 children: [
//                   // Display the first image
//                   // Image.asset('images/Icon.jpg'), // Replace with your image path
//                   // SizedBox(width: 10.0), // Add spacing between images
            
//                   IconButton(
//                     icon: Icon(Icons.info_outline), // Use info outline icon
//                     onPressed: () {
//                       infoDialogueGenerate(context);
//                       print("Info button pressed!");
//                     },
//                   ),
//                 ],
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceAround,
//                 children: [
//                   GeneratingMode(text: 'Extra Clever \nScraping'),
//                   GeneratingMode(text: 'Fast And \nAccurate'),
//                 ],
//               ),
//               Column(
//                 children: [
//                   SuggestionButton(text: "Load-shedding in Pakistan, and Government"),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       SuggestionButton(text: "Global Warming"),
//                       SuggestionButton(text: "Terrorism"),
//                     ],
//                   ),
//                 ],
//               ),
//               Row(
//                 children: [
//                   Expanded(
//                     child: QueryBar(),
//                   ),
//                   GenerateButton(),
//                 ],
//               ),
//             ],
//                     ),
//           ),
//       ),
//     );
//   }

//   Future<dynamic> infoDialogueGenerate(BuildContext context) {
//     return showDialog(
//     context: context,
//     builder: (BuildContext context) {
//       return AlertDialog(
//         title: Text('Guide'),
//         content: Text('Enter the prompt for generatingassignment or you can get started with the given suggestions.'),
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

// class GeneratingMode extends StatelessWidget {
//   const GeneratingMode({
//     super.key,
//     required this.text,
//   });
//   final String text;

//   @override
//   Widget build(BuildContext context) {
//     final themeProvider = Provider.of<ThemeProvider>(context);
//     return TextButton(
//         onPressed: () {
//           // To be Implemented Module
//           themeProvider.changeTheme(ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 255, 0, 0),)));
//           print('button pressed!');
//         },
//         child: Container(
//         width: 100.0,
//         height: 100.0,
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(10.0), // Set rounded corners
//           border: Border.all(
//             color: Colors.blue,
//             width: 1.0,
//           ),
//         ),
//         child: Center(
//           child: Text(
//             text, style: TextStyle(
//               fontSize: 14.0,
//               color: Colors.blue,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// class SuggestionButton extends StatelessWidget {
//   const SuggestionButton({
//     super.key,
//     required this.text,
//   });

//   final String text;

//   @override
//   Widget build(BuildContext context) {
//     return ElevatedButton(
//         onPressed: () {
//           textController.text = text;
//           print('button pressed!');
//         },
//         child: Text(text),
//       );
//   }
// }

// class QueryBar extends StatelessWidget {
//   const QueryBar({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return TextField(
//       controller: textController,
//       decoration: InputDecoration(
//         hintText: "Enter query...",
//         prefixIcon: Icon(Icons.search),
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(30.0),
//         ),
//       ),
//     );
//   }
// }

// class GenerateButton extends StatelessWidget {
//   const GenerateButton({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context); 
//     return IconButton(
//       icon: Card(
//         color: theme.primaryColor,
//         margin: const EdgeInsets.all(0),
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(30.0),
//         ),
//         elevation: 5.0,
//         child: Padding(
//           padding: const EdgeInsets.all(10.0),
//           child: Icon(
//             Icons.arrow_forward,
//             color: Colors.white,
//           ),
//         )
//       ),
//       onPressed: () {
//         // To be implemented Module (Data processing Module)
//         print("Search button pressed!");
//       },
//     );
//   }
// }




import 'package:flutter/material.dart';

Widget showGenerator() {
  return MyApp();
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          // child: Image.asset('assets/logo.png'), // Replace with your logo asset
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.info_outline, color: Colors.blue),
            onPressed: () {
              // Info button action
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FeatureButton(
                  icon: Icons.emoji_objects, // Corrected icon name
                  label: 'Extra Clever Scraping',
                ),
                FeatureButton(
                  icon: Icons.flash_on, // Corrected icon name
                  label: 'Fast And Accurate',
                ),
              ],
            ),
            SizedBox(height: 40),
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
            Spacer(),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Start generating...',
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
                    ),
                  ),
                ),
                SizedBox(width: 8),
                FloatingActionButton(
                  onPressed: () {
                    // Action button action
                  },
                  child: Icon(Icons.arrow_upward),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class FeatureButton extends StatelessWidget {
  final IconData icon;
  final String label;

  const FeatureButton({
    Key? key,
    required this.icon,
    required this.label,
  }) : super(key: key);

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
        padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
      ),
      onPressed: () {
        // Feature button action
      },
      child: Column(
        children: [
          Icon(icon, size: 40, color: Colors.blue),
          SizedBox(height: 8),
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
    Key? key,
    required this.label,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        // primary: Colors.grey.shade200,
        // onPrimary: Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        padding: EdgeInsets.symmetric(horizontal: 24.0),
      ),
      onPressed: () {
        onPressed(); // Call the provided callback function
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Button clicked: $label'),
            duration: Duration(milliseconds: 1500), // Display for 1.5 seconds
          ),
        );
      },
      child: Text(label),
    );
  }
}
