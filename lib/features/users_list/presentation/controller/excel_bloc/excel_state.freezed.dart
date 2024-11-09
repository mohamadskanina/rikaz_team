// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'excel_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ExcelState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function(String message) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? success,
    TResult? Function(String message)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function(String message)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(LoadingExcel value) loading,
    required TResult Function(SuccessExcel value) success,
    required TResult Function(FailureExcel value) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(LoadingExcel value)? loading,
    TResult? Function(SuccessExcel value)? success,
    TResult? Function(FailureExcel value)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(LoadingExcel value)? loading,
    TResult Function(SuccessExcel value)? success,
    TResult Function(FailureExcel value)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExcelStateCopyWith<$Res> {
  factory $ExcelStateCopyWith(
          ExcelState value, $Res Function(ExcelState) then) =
      _$ExcelStateCopyWithImpl<$Res, ExcelState>;
}

/// @nodoc
class _$ExcelStateCopyWithImpl<$Res, $Val extends ExcelState>
    implements $ExcelStateCopyWith<$Res> {
  _$ExcelStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$ExcelStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'ExcelState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function(String message) failure,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? success,
    TResult? Function(String message)? failure,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function(String message)? failure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(LoadingExcel value) loading,
    required TResult Function(SuccessExcel value) success,
    required TResult Function(FailureExcel value) failure,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(LoadingExcel value)? loading,
    TResult? Function(SuccessExcel value)? success,
    TResult? Function(FailureExcel value)? failure,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(LoadingExcel value)? loading,
    TResult Function(SuccessExcel value)? success,
    TResult Function(FailureExcel value)? failure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements ExcelState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$LoadingExcelImplCopyWith<$Res> {
  factory _$$LoadingExcelImplCopyWith(
          _$LoadingExcelImpl value, $Res Function(_$LoadingExcelImpl) then) =
      __$$LoadingExcelImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingExcelImplCopyWithImpl<$Res>
    extends _$ExcelStateCopyWithImpl<$Res, _$LoadingExcelImpl>
    implements _$$LoadingExcelImplCopyWith<$Res> {
  __$$LoadingExcelImplCopyWithImpl(
      _$LoadingExcelImpl _value, $Res Function(_$LoadingExcelImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoadingExcelImpl implements LoadingExcel {
  const _$LoadingExcelImpl();

  @override
  String toString() {
    return 'ExcelState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadingExcelImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function(String message) failure,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? success,
    TResult? Function(String message)? failure,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function(String message)? failure,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(LoadingExcel value) loading,
    required TResult Function(SuccessExcel value) success,
    required TResult Function(FailureExcel value) failure,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(LoadingExcel value)? loading,
    TResult? Function(SuccessExcel value)? success,
    TResult? Function(FailureExcel value)? failure,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(LoadingExcel value)? loading,
    TResult Function(SuccessExcel value)? success,
    TResult Function(FailureExcel value)? failure,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class LoadingExcel implements ExcelState {
  const factory LoadingExcel() = _$LoadingExcelImpl;
}

/// @nodoc
abstract class _$$SuccessExcelImplCopyWith<$Res> {
  factory _$$SuccessExcelImplCopyWith(
          _$SuccessExcelImpl value, $Res Function(_$SuccessExcelImpl) then) =
      __$$SuccessExcelImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SuccessExcelImplCopyWithImpl<$Res>
    extends _$ExcelStateCopyWithImpl<$Res, _$SuccessExcelImpl>
    implements _$$SuccessExcelImplCopyWith<$Res> {
  __$$SuccessExcelImplCopyWithImpl(
      _$SuccessExcelImpl _value, $Res Function(_$SuccessExcelImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$SuccessExcelImpl implements SuccessExcel {
  const _$SuccessExcelImpl();

  @override
  String toString() {
    return 'ExcelState.success()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SuccessExcelImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function(String message) failure,
  }) {
    return success();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? success,
    TResult? Function(String message)? failure,
  }) {
    return success?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function(String message)? failure,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(LoadingExcel value) loading,
    required TResult Function(SuccessExcel value) success,
    required TResult Function(FailureExcel value) failure,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(LoadingExcel value)? loading,
    TResult? Function(SuccessExcel value)? success,
    TResult? Function(FailureExcel value)? failure,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(LoadingExcel value)? loading,
    TResult Function(SuccessExcel value)? success,
    TResult Function(FailureExcel value)? failure,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class SuccessExcel implements ExcelState {
  const factory SuccessExcel() = _$SuccessExcelImpl;
}

/// @nodoc
abstract class _$$FailureExcelImplCopyWith<$Res> {
  factory _$$FailureExcelImplCopyWith(
          _$FailureExcelImpl value, $Res Function(_$FailureExcelImpl) then) =
      __$$FailureExcelImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$FailureExcelImplCopyWithImpl<$Res>
    extends _$ExcelStateCopyWithImpl<$Res, _$FailureExcelImpl>
    implements _$$FailureExcelImplCopyWith<$Res> {
  __$$FailureExcelImplCopyWithImpl(
      _$FailureExcelImpl _value, $Res Function(_$FailureExcelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$FailureExcelImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$FailureExcelImpl implements FailureExcel {
  const _$FailureExcelImpl({required this.message});

  @override
  final String message;

  @override
  String toString() {
    return 'ExcelState.failure(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FailureExcelImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FailureExcelImplCopyWith<_$FailureExcelImpl> get copyWith =>
      __$$FailureExcelImplCopyWithImpl<_$FailureExcelImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function(String message) failure,
  }) {
    return failure(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? success,
    TResult? Function(String message)? failure,
  }) {
    return failure?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function(String message)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(LoadingExcel value) loading,
    required TResult Function(SuccessExcel value) success,
    required TResult Function(FailureExcel value) failure,
  }) {
    return failure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(LoadingExcel value)? loading,
    TResult? Function(SuccessExcel value)? success,
    TResult? Function(FailureExcel value)? failure,
  }) {
    return failure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(LoadingExcel value)? loading,
    TResult Function(SuccessExcel value)? success,
    TResult Function(FailureExcel value)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class FailureExcel implements ExcelState {
  const factory FailureExcel({required final String message}) =
      _$FailureExcelImpl;

  String get message;
  @JsonKey(ignore: true)
  _$$FailureExcelImplCopyWith<_$FailureExcelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
