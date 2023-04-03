import 'package:freezed_annotation/freezed_annotation.dart';

part 'level.freezed.dart';

@freezed
class Level with _$Level {
  const Level._();

  const factory Level({
    required int rows,
    required int columns,
    required List<int> walls,
  }) = _Level;

  int get area => rows * columns;
}

