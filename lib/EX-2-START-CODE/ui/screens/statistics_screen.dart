import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/color_counters.dart';

class StatisticsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Statistics'),
      ),
      body: Center(
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
      ),
    );
  }
}