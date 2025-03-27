import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'ui/providers/color_counters.dart';
import 'ui/screens/color_taps_page.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ColorCountersProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: ColorTapsPage(),
      ),
    ),
  );
}