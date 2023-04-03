import 'package:freezed_annotation/freezed_annotation.dart';

part 'snake_body.freezed.dart';

@freezed
class SnakeBody with _$SnakeBody {
  const factory SnakeBody({
    required List<int> body,
  }) = _SnakeBody;
}
