import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_snake/models/snake.dart';

class TurnNotifier extends StateNotifier<Direction> {
  TurnNotifier() : super(Direction.top);

  set direction(Direction direction) => state = direction;

  Direction get direction => state;
}

final turnProvider = StateNotifierProvider.autoDispose<TurnNotifier, Direction>(
  (ref) => TurnNotifier(),
);
