import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/color_counters.dart';

class ColorTapsPage extends StatefulWidget {
  @override
  _ColorTapsPageState createState() => _ColorTapsPageState();
}

class _ColorTapsPageState extends State<ColorTapsPage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    HomePage(),
    StatisticsPage()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Color Taps'),
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart),
            label: 'Statistics',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Row(
            children: [
              Expanded(
                child: Consumer<ColorCountersProvider>(
                  builder: (context, provider, child) {
                    return GestureDetector(
                      onTap: () {
                        provider.incrementRed(); // Directly call increment method
                      },
                      child: Container(
                        color: Colors.red,
                        child: Center(
                          child: Text(
                            'Tap 1\nRed Taps: ${provider.colorCounters.redTaps}', // Show current taps
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white, 
                              fontSize: 24
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              Expanded(
                child: Consumer<ColorCountersProvider>(
                  builder: (context, provider, child) {
                    return GestureDetector(
                      onTap: () {
                        provider.incrementBlue(); // Directly call increment method
                      },
                      child: Container(
                        color: Colors.blue,
                        child: Center(
                          child: Text(
                            'Tap 2\nBlue Taps: ${provider.colorCounters.blueTaps}', // Show current taps
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white, 
                              fontSize: 24
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class StatisticsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Consumer<ColorCountersProvider>(
        builder: (context, provider, child) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Tap Statistics',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Red Taps: ${provider.colorCounters.redTaps}',
                style: TextStyle(fontSize: 18),
              ),
              Text(
                'Blue Taps: ${provider.colorCounters.blueTaps}',
                style: TextStyle(fontSize: 18),
              ),
            ],
          );
        },
      ),
    );
  }
}