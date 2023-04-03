import 'package:flutter_snake/models/snake_body.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'snake.freezed.dart';

enum Direction {
  top,
  left,
  bottom,
  right,
}

enum Speed {
  slow,
  medium,
  fast,
}

@freezed
class Snake with _$Snake {
  const factory Snake({
    required Direction direction,
    required Speed speed,
  }) = _Snake;
}
