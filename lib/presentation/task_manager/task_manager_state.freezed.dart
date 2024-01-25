// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'task_manager_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$TaskManagerState {
  List<Task> get initialTasks => throw _privateConstructorUsedError;
  List<Task> get filteredTasks => throw _privateConstructorUsedError;
  Exception? get exception => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TaskManagerStateCopyWith<TaskManagerState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TaskManagerStateCopyWith<$Res> {
  factory $TaskManagerStateCopyWith(
          TaskManagerState value, $Res Function(TaskManagerState) then) =
      _$TaskManagerStateCopyWithImpl<$Res, TaskManagerState>;
  @useResult
  $Res call(
      {List<Task> initialTasks,
      List<Task> filteredTasks,
      Exception? exception,
      bool isLoading});
}

/// @nodoc
class _$TaskManagerStateCopyWithImpl<$Res, $Val extends TaskManagerState>
    implements $TaskManagerStateCopyWith<$Res> {
  _$TaskManagerStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? initialTasks = null,
    Object? filteredTasks = null,
    Object? exception = freezed,
    Object? isLoading = null,
  }) {
    return _then(_value.copyWith(
      initialTasks: null == initialTasks
          ? _value.initialTasks
          : initialTasks // ignore: cast_nullable_to_non_nullable
              as List<Task>,
      filteredTasks: null == filteredTasks
          ? _value.filteredTasks
          : filteredTasks // ignore: cast_nullable_to_non_nullable
              as List<Task>,
      exception: freezed == exception
          ? _value.exception
          : exception // ignore: cast_nullable_to_non_nullable
              as Exception?,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TaskManagerStateImplCopyWith<$Res>
    implements $TaskManagerStateCopyWith<$Res> {
  factory _$$TaskManagerStateImplCopyWith(_$TaskManagerStateImpl value,
          $Res Function(_$TaskManagerStateImpl) then) =
      __$$TaskManagerStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<Task> initialTasks,
      List<Task> filteredTasks,
      Exception? exception,
      bool isLoading});
}

/// @nodoc
class __$$TaskManagerStateImplCopyWithImpl<$Res>
    extends _$TaskManagerStateCopyWithImpl<$Res, _$TaskManagerStateImpl>
    implements _$$TaskManagerStateImplCopyWith<$Res> {
  __$$TaskManagerStateImplCopyWithImpl(_$TaskManagerStateImpl _value,
      $Res Function(_$TaskManagerStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? initialTasks = null,
    Object? filteredTasks = null,
    Object? exception = freezed,
    Object? isLoading = null,
  }) {
    return _then(_$TaskManagerStateImpl(
      initialTasks: null == initialTasks
          ? _value._initialTasks
          : initialTasks // ignore: cast_nullable_to_non_nullable
              as List<Task>,
      filteredTasks: null == filteredTasks
          ? _value._filteredTasks
          : filteredTasks // ignore: cast_nullable_to_non_nullable
              as List<Task>,
      exception: freezed == exception
          ? _value.exception
          : exception // ignore: cast_nullable_to_non_nullable
              as Exception?,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$TaskManagerStateImpl extends _TaskManagerState {
  const _$TaskManagerStateImpl(
      {required final List<Task> initialTasks,
      required final List<Task> filteredTasks,
      required this.exception,
      required this.isLoading})
      : _initialTasks = initialTasks,
        _filteredTasks = filteredTasks,
        super._();

  final List<Task> _initialTasks;
  @override
  List<Task> get initialTasks {
    if (_initialTasks is EqualUnmodifiableListView) return _initialTasks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_initialTasks);
  }

  final List<Task> _filteredTasks;
  @override
  List<Task> get filteredTasks {
    if (_filteredTasks is EqualUnmodifiableListView) return _filteredTasks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_filteredTasks);
  }

  @override
  final Exception? exception;
  @override
  final bool isLoading;

  @override
  String toString() {
    return 'TaskManagerState(initialTasks: $initialTasks, filteredTasks: $filteredTasks, exception: $exception, isLoading: $isLoading)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TaskManagerStateImpl &&
            const DeepCollectionEquality()
                .equals(other._initialTasks, _initialTasks) &&
            const DeepCollectionEquality()
                .equals(other._filteredTasks, _filteredTasks) &&
            (identical(other.exception, exception) ||
                other.exception == exception) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_initialTasks),
      const DeepCollectionEquality().hash(_filteredTasks),
      exception,
      isLoading);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TaskManagerStateImplCopyWith<_$TaskManagerStateImpl> get copyWith =>
      __$$TaskManagerStateImplCopyWithImpl<_$TaskManagerStateImpl>(
          this, _$identity);
}

abstract class _TaskManagerState extends TaskManagerState {
  const factory _TaskManagerState(
      {required final List<Task> initialTasks,
      required final List<Task> filteredTasks,
      required final Exception? exception,
      required final bool isLoading}) = _$TaskManagerStateImpl;
  const _TaskManagerState._() : super._();

  @override
  List<Task> get initialTasks;
  @override
  List<Task> get filteredTasks;
  @override
  Exception? get exception;
  @override
  bool get isLoading;
  @override
  @JsonKey(ignore: true)
  _$$TaskManagerStateImplCopyWith<_$TaskManagerStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
