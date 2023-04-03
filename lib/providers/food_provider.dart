import 'dart:math';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_snake/providers/snake_provider.dart';

import 'level_provider.dart';

class FoodNotifier extends StateNotifier<int> {
  final LevelNotifier levelNotifier;
  final SnakeBodyNotifier snakeBodyNotifier;

  FoodNotifier(
    this.levelNotifier,
    this.snakeBodyNotifier,
  ) : super(
          Random().nextInt(levelNotifier.state.area),
        ) {
    generateFood();
  }

  set food(int value) => state = value;

  int get food => state;

  void generateFood() {
    state = Random().nextInt(levelNotifier.state.area);
    if (levelNotifier.walls.contains(state) ||
        snakeBodyNotifier.body.contains(state)) {
      generateFood();
    }
  }
}

final foodProvider = StateNotifierProvider<FoodNotifier, int>((ref) {
  return FoodNotifier(
    ref.watch(levelProvider.notifier),
    ref.watch(snakeBodyProvider.notifier),
  );
});
