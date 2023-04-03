import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_snake/models/level.dart';

class LevelNotifier extends StateNotifier<Level> {
  LevelNotifier()
      : super(
          levels[1],
        );

  set walls(List<int> value) => state.copyWith(walls: value);

  List<int> get walls => state.walls;

  int get rows => state.rows;

  int get columns => state.columns;
}

final levelProvider =
    StateNotifierProvider<LevelNotifier, Level>((ref) => LevelNotifier());

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
  const Level(columns: 20, rows: 20, walls: []),
  const Level(columns: 20, rows: 20, walls: []),
  const Level(columns: 20, rows: 20, walls: []),
];
