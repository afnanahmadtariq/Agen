import 'dart:math';

import 'package:flutter/material.dart';
class Popups {
  static Future<dynamic> error(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return Scaffold(
          backgroundColor: Colors.transparent,
          body: Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                width: 300,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Align(
                      alignment: Alignment.topRight,
                      child: IconButton(
                        icon: const Icon(Icons.close, color: Colors.red),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Icon(Icons.error_outline, size: 100, color: Colors.red),
                    const SizedBox(height: 20),
                    const Text(
                      'Something went wrong',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Please try again later.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black54,
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }


  static Future<dynamic> loading(BuildContext context) {
    return showDialog(
      context: context, 
      builder: (BuildContext context) {
        return LoadingScreen();
      }
    );
  }

}




class LoadingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            width: 300,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 20),
                AnimatedCircularLoader(),
                const SizedBox(height: 20),
                const Text(
                  'Loading, please wait...',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class AnimatedCircularLoader extends StatefulWidget {
  @override
  _AnimatedCircularLoaderState createState() => _AnimatedCircularLoaderState();
}

class _AnimatedCircularLoaderState extends State<AnimatedCircularLoader>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      height: 100,
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return CustomPaint(
            painter: CircularLoadingPainter(_controller.value),
          );
        },
      ),
    );
  }
}

class CircularLoadingPainter extends CustomPainter {
  final double progress;
  CircularLoadingPainter(this.progress);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blue
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 4.0;

    final double radius = size.width / 2;
    final double angle = progress * 2 * pi;

    for (int i = 0; i < 12; i++) {
      final double startAngle = angle + (i * 2 * pi / 12);
      final double endAngle = startAngle + (pi / 8);

      final double startX = radius + radius * cos(startAngle);
      final double startY = radius + radius * sin(startAngle);

      final double endX = radius + radius * cos(endAngle);
      final double endY = radius + radius * sin(endAngle);

      final paintAlpha = (255 * (1 - i / 12)).toInt();
      paint.color = Colors.blue.withAlpha(paintAlpha);

      canvas.drawLine(Offset(startX, startY), Offset(endX, endY), paint);
    }
  }

  @override
  bool shouldRepaint(CircularLoadingPainter oldDelegate) {
    return true;
  }
}

// Use the `LoadingScreen` widget in your app
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Loading Screen Example')),
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              LoadingScreen().build(context);
            },
            child: const Text('Show Loading Screen'),
          ),
        ),
      ),
    );
  }
}