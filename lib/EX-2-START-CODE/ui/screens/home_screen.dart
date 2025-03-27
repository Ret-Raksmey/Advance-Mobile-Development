import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/color_counters.dart';
import 'statistics_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Color Taps'),
        actions: [
          IconButton(
            icon: Icon(Icons.bar_chart),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => StatisticsScreen()),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Consumer<ColorCountersProvider>(
                    builder: (context, provider, child) {
                      return GestureDetector(
                        onTap: () => provider.incrementRed(),
                        child: Container(
                          color: Colors.red,
                          child: Center(
                            child: Text(
                              'Tap 1',
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
                        onTap: () => provider.incrementBlue(),
                        child: Container(
                          color: Colors.blue,
                          child: Center(
                            child: Text(
                              'Tap 2',
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
      ),
    );
  }
}