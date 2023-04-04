import 'package:flutter_riverpod/flutter_riverpod.dart';

class DifficultNotifier extends StateNotifier<Duration> {
  DifficultNotifier() : super(const Duration(milliseconds: 300));

  set difficult(Duration duration) => state = duration;

  Duration get difficult => state;
}

final difficultProvider =
StateNotifierProvider<DifficultNotifier, Duration>(
      (ref) {
    return DifficultNotifier();
  },
);
