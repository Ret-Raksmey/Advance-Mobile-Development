import 'package:flutter/foundation.dart';
import '../../model/color_counters.dart';

class ColorCountersProvider extends ChangeNotifier {
  final ColorCounters _colorCounters = ColorCounters();

  ColorCounters get colorCounters => _colorCounters;

  void incrementRed() {
    _colorCounters.incrementRed();
    notifyListeners();
  }

  void incrementBlue() {
    _colorCounters.incrementBlue();
    notifyListeners();
  }
}