// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'snake_body.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SnakeBody {
  List<int> get body => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SnakeBodyCopyWith<SnakeBody> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SnakeBodyCopyWith<$Res> {
  factory $SnakeBodyCopyWith(SnakeBody value, $Res Function(SnakeBody) then) =
  _$SnakeBodyCopyWithImpl<$Res, SnakeBody>;

  @useResult
  $Res call({List<int> body});
}

/// @nodoc
class _$SnakeBodyCopyWithImpl<$Res, $Val extends SnakeBody>
    implements $SnakeBodyCopyWith<$Res> {
  _$SnakeBodyCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;

  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? body = null,
  }) {
    return _then(_value.copyWith(
      body: null == body
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
      as List<int>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SnakeBodyCopyWith<$Res> implements $SnakeBodyCopyWith<$Res> {
  factory _$$_SnakeBodyCopyWith(_$_SnakeBody value,
      $Res Function(_$_SnakeBody) then) =
  __$$_SnakeBodyCopyWithImpl<$Res>;

  @override
  @useResult
  $Res call({List<int> body});
}

/// @nodoc
class __$$_SnakeBodyCopyWithImpl<$Res>
    extends _$SnakeBodyCopyWithImpl<$Res, _$_SnakeBody>
    implements _$$_SnakeBodyCopyWith<$Res> {
  __$$_SnakeBodyCopyWithImpl(_$_SnakeBody _value,
      $Res Function(_$_SnakeBody) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? body = null,
  }) {
    return _then(_$_SnakeBody(
      body: null == body
          ? _value._body
          : body // ignore: cast_nullable_to_non_nullable
      as List<int>,
    ));
  }
}

/// @nodoc

class _$_SnakeBody implements _SnakeBody {
  const _$_SnakeBody({required final List<int> body}) : _body = body;

  final List<int> _body;

  @override
  List<int> get body {
    if (_body is EqualUnmodifiableListView) return _body;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_body);
  }

  @override
  String toString() {
    return 'SnakeBody(body: $body)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SnakeBody &&
            const DeepCollectionEquality().equals(other._body, _body));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_body));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SnakeBodyCopyWith<_$_SnakeBody> get copyWith =>
      __$$_SnakeBodyCopyWithImpl<_$_SnakeBody>(this, _$identity);
}

abstract class _SnakeBody implements SnakeBody {
  const factory _SnakeBody({required final List<int> body}) = _$_SnakeBody;

  @override
  List<int> get body;

  @override
  @JsonKey(ignore: true)
  _$$_SnakeBodyCopyWith<_$_SnakeBody> get copyWith =>
      throw _privateConstructorUsedError;
}
