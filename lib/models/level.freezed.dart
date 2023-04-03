// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'level.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Level {
  int get rows => throw _privateConstructorUsedError;

  int get columns => throw _privateConstructorUsedError;

  List<int> get walls => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LevelCopyWith<Level> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LevelCopyWith<$Res> {
  factory $LevelCopyWith(Level value, $Res Function(Level) then) =
      _$LevelCopyWithImpl<$Res, Level>;

  @useResult
  $Res call({int rows, int columns, List<int> walls});
}

/// @nodoc
class _$LevelCopyWithImpl<$Res, $Val extends Level>
    implements $LevelCopyWith<$Res> {
  _$LevelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rows = null,
    Object? columns = null,
    Object? walls = null,
  }) {
    return _then(_value.copyWith(
      rows: null == rows
          ? _value.rows
          : rows // ignore: cast_nullable_to_non_nullable
              as int,
      columns: null == columns
          ? _value.columns
          : columns // ignore: cast_nullable_to_non_nullable
              as int,
      walls: null == walls
          ? _value.walls
          : walls // ignore: cast_nullable_to_non_nullable
              as List<int>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_LevelCopyWith<$Res> implements $LevelCopyWith<$Res> {
  factory _$$_LevelCopyWith(_$_Level value, $Res Function(_$_Level) then) =
      __$$_LevelCopyWithImpl<$Res>;

  @override
  @useResult
  $Res call({int rows, int columns, List<int> walls});
}

/// @nodoc
class __$$_LevelCopyWithImpl<$Res> extends _$LevelCopyWithImpl<$Res, _$_Level>
    implements _$$_LevelCopyWith<$Res> {
  __$$_LevelCopyWithImpl(_$_Level _value, $Res Function(_$_Level) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rows = null,
    Object? columns = null,
    Object? walls = null,
  }) {
    return _then(_$_Level(
      rows: null == rows
          ? _value.rows
          : rows // ignore: cast_nullable_to_non_nullable
              as int,
      columns: null == columns
          ? _value.columns
          : columns // ignore: cast_nullable_to_non_nullable
              as int,
      walls: null == walls
          ? _value._walls
          : walls // ignore: cast_nullable_to_non_nullable
              as List<int>,
    ));
  }
}

/// @nodoc

class _$_Level extends _Level {
  const _$_Level(
      {required this.rows,
      required this.columns,
      required final List<int> walls})
      : _walls = walls,
        super._();

  @override
  final int rows;
  @override
  final int columns;
  final List<int> _walls;

  @override
  List<int> get walls {
    if (_walls is EqualUnmodifiableListView) return _walls;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_walls);
  }

  @override
  String toString() {
    return 'Level(rows: $rows, columns: $columns, walls: $walls)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Level &&
            (identical(other.rows, rows) || other.rows == rows) &&
            (identical(other.columns, columns) || other.columns == columns) &&
            const DeepCollectionEquality().equals(other._walls, _walls));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, rows, columns, const DeepCollectionEquality().hash(_walls));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LevelCopyWith<_$_Level> get copyWith =>
      __$$_LevelCopyWithImpl<_$_Level>(this, _$identity);
}

abstract class _Level extends Level {
  const factory _Level(
      {required final int rows,
      required final int columns,
      required final List<int> walls}) = _$_Level;

  const _Level._() : super._();

  @override
  int get rows;

  @override
  int get columns;

  @override
  List<int> get walls;

  @override
  @JsonKey(ignore: true)
  _$$_LevelCopyWith<_$_Level> get copyWith =>
      throw _privateConstructorUsedError;
}
