// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'excel_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ExcelEvent {
  List<User> get users => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<User> users) exoprtToExcel,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<User> users)? exoprtToExcel,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<User> users)? exoprtToExcel,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ExportToEcel value) exoprtToExcel,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ExportToEcel value)? exoprtToExcel,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ExportToEcel value)? exoprtToExcel,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ExcelEventCopyWith<ExcelEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExcelEventCopyWith<$Res> {
  factory $ExcelEventCopyWith(
          ExcelEvent value, $Res Function(ExcelEvent) then) =
      _$ExcelEventCopyWithImpl<$Res, ExcelEvent>;
  @useResult
  $Res call({List<User> users});
}

/// @nodoc
class _$ExcelEventCopyWithImpl<$Res, $Val extends ExcelEvent>
    implements $ExcelEventCopyWith<$Res> {
  _$ExcelEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? users = null,
  }) {
    return _then(_value.copyWith(
      users: null == users
          ? _value.users
          : users // ignore: cast_nullable_to_non_nullable
              as List<User>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ExportToEcelImplCopyWith<$Res>
    implements $ExcelEventCopyWith<$Res> {
  factory _$$ExportToEcelImplCopyWith(
          _$ExportToEcelImpl value, $Res Function(_$ExportToEcelImpl) then) =
      __$$ExportToEcelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<User> users});
}

/// @nodoc
class __$$ExportToEcelImplCopyWithImpl<$Res>
    extends _$ExcelEventCopyWithImpl<$Res, _$ExportToEcelImpl>
    implements _$$ExportToEcelImplCopyWith<$Res> {
  __$$ExportToEcelImplCopyWithImpl(
      _$ExportToEcelImpl _value, $Res Function(_$ExportToEcelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? users = null,
  }) {
    return _then(_$ExportToEcelImpl(
      null == users
          ? _value._users
          : users // ignore: cast_nullable_to_non_nullable
              as List<User>,
    ));
  }
}

/// @nodoc

class _$ExportToEcelImpl implements ExportToEcel {
  const _$ExportToEcelImpl(final List<User> users) : _users = users;

  final List<User> _users;
  @override
  List<User> get users {
    if (_users is EqualUnmodifiableListView) return _users;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_users);
  }

  @override
  String toString() {
    return 'ExcelEvent.exoprtToExcel(users: $users)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ExportToEcelImpl &&
            const DeepCollectionEquality().equals(other._users, _users));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_users));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ExportToEcelImplCopyWith<_$ExportToEcelImpl> get copyWith =>
      __$$ExportToEcelImplCopyWithImpl<_$ExportToEcelImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<User> users) exoprtToExcel,
  }) {
    return exoprtToExcel(users);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<User> users)? exoprtToExcel,
  }) {
    return exoprtToExcel?.call(users);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<User> users)? exoprtToExcel,
    required TResult orElse(),
  }) {
    if (exoprtToExcel != null) {
      return exoprtToExcel(users);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ExportToEcel value) exoprtToExcel,
  }) {
    return exoprtToExcel(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ExportToEcel value)? exoprtToExcel,
  }) {
    return exoprtToExcel?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ExportToEcel value)? exoprtToExcel,
    required TResult orElse(),
  }) {
    if (exoprtToExcel != null) {
      return exoprtToExcel(this);
    }
    return orElse();
  }
}

abstract class ExportToEcel implements ExcelEvent {
  const factory ExportToEcel(final List<User> users) = _$ExportToEcelImpl;

  @override
  List<User> get users;
  @override
  @JsonKey(ignore: true)
  _$$ExportToEcelImplCopyWith<_$ExportToEcelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
