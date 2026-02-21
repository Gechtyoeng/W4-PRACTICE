import 'package:flutter/material.dart';
import 'package:w4_practice/1_color_app/color_service.dart';

ColorService colorService = ColorService();
void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: Scaffold(body: Home())));
}

enum CardType { red, blue }

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _currentIndex == 0 ? ColorTapsScreen() : StatisticsScreen(),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.tap_and_play), label: 'Taps'),
          BottomNavigationBarItem(icon: Icon(Icons.bar_chart), label: 'Statistics'),
        ],
      ),
    );
  }
}

class ColorTapsScreen extends StatelessWidget {
  const ColorTapsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: colorService,
      builder: (BuildContext context, Widget? child) {
        return Scaffold(
          appBar: AppBar(title: Text('Color Taps')),
          body: Column(
            children: [
              ColorTap(type: CardType.red),
              ColorTap(type: CardType.blue),
            ],
          ),
        );
      },
    );
  }
}

class ColorTap extends StatelessWidget {
  final CardType type;

  const ColorTap({super.key, required this.type});

  Color get backgroundColor => type == CardType.red ? Colors.red : Colors.blue;
  int get tapCount => type == CardType.red ? colorService.redCounter : colorService.blueCounter;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => type == CardType.red ? colorService.onRedCounterTap() : colorService.onBlueCounterTap(),
      child: Container(
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(color: backgroundColor, borderRadius: BorderRadius.circular(10)),
        width: double.infinity,
        height: 100,
        child: Center(
          child: Text('Taps: $tapCount', style: TextStyle(fontSize: 24, color: Colors.white)),
        ),
      ),
    );
  }
}

class StatisticsScreen extends StatelessWidget {
  const StatisticsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: colorService,
      builder: (BuildContext context, Widget? child) {
        return Scaffold(
          appBar: AppBar(title: Text('Statistics')),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Red Taps: ${colorService.redCounter}', style: TextStyle(fontSize: 24)),
                Text('Blue Taps: ${colorService.redCounter}', style: TextStyle(fontSize: 24)),
              ],
            ),
          ),
        );
      },
    );
  }
}
