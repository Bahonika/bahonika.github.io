import 'dart:math';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_snake/models/level.dart';

class LevelNotifier extends StateNotifier<Level> {
  LevelNotifier()
      : super(
          levels[1],
        );

  void level(Level value) => state = value;

  set walls(List<int> value) => state.copyWith(walls: value);

  List<int> get walls => state.walls;

  int get rows => state.rows;

  int get columns => state.columns;
}

final levelProvider = StateNotifierProvider<LevelNotifier, Level>(
        (ref) => LevelNotifier());

List<Level> levels = [
  const Level(columns: 20, rows: 20, walls: []),
  Level(
    columns: 20,
    rows: 20,
    // walls:  []
    walls: List.generate(20, (index) => index)
      ..addAll(
        List.generate(20, (index) => index * 20),
      )
      ..addAll(
        List.generate(20, (index) => index * 20 - 1),
      )
      ..addAll(
        List.generate(20, (index) => 20 * 20 - index - 1),
      ),
  ),
  const Level(columns: 10, rows: 10, walls: []),
  Level(
      columns: 15,
      rows: 15,
      walls: List.generate(15, (index) => 15 * index + 7)
        ..addAll(
          List.generate(15, (index) => index + 7 * 15),
        )),
  Level(
    columns: 20,
    rows: 20,
    walls: List.generate(
      20 * 20,
      (index) => (Random().nextInt(10) == 9) ? index : -1,
    ),
  ),
];
