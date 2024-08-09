// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cart_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CartState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() addAndRemoveFromCart,
    required TResult Function(int numberOfItems, double subtotal,
            double deliveryCharges, double total)
        totalsUpdated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? addAndRemoveFromCart,
    TResult? Function(int numberOfItems, double subtotal,
            double deliveryCharges, double total)?
        totalsUpdated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? addAndRemoveFromCart,
    TResult Function(int numberOfItems, double subtotal, double deliveryCharges,
            double total)?
        totalsUpdated,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_AddAndRemoveFromCart value) addAndRemoveFromCart,
    required TResult Function(_TotalsUpdated value) totalsUpdated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_AddAndRemoveFromCart value)? addAndRemoveFromCart,
    TResult? Function(_TotalsUpdated value)? totalsUpdated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_AddAndRemoveFromCart value)? addAndRemoveFromCart,
    TResult Function(_TotalsUpdated value)? totalsUpdated,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CartStateCopyWith<$Res> {
  factory $CartStateCopyWith(CartState value, $Res Function(CartState) then) =
      _$CartStateCopyWithImpl<$Res, CartState>;
}

/// @nodoc
class _$CartStateCopyWithImpl<$Res, $Val extends CartState>
    implements $CartStateCopyWith<$Res> {
  _$CartStateCopyWithImpl(this._value, this._then);

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
    extends _$CartStateCopyWithImpl<$Res, _$InitialImpl>
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
    return 'CartState.initial()';
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
    required TResult Function() addAndRemoveFromCart,
    required TResult Function(int numberOfItems, double subtotal,
            double deliveryCharges, double total)
        totalsUpdated,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? addAndRemoveFromCart,
    TResult? Function(int numberOfItems, double subtotal,
            double deliveryCharges, double total)?
        totalsUpdated,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? addAndRemoveFromCart,
    TResult Function(int numberOfItems, double subtotal, double deliveryCharges,
            double total)?
        totalsUpdated,
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
    required TResult Function(_AddAndRemoveFromCart value) addAndRemoveFromCart,
    required TResult Function(_TotalsUpdated value) totalsUpdated,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_AddAndRemoveFromCart value)? addAndRemoveFromCart,
    TResult? Function(_TotalsUpdated value)? totalsUpdated,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_AddAndRemoveFromCart value)? addAndRemoveFromCart,
    TResult Function(_TotalsUpdated value)? totalsUpdated,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements CartState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$AddAndRemoveFromCartImplCopyWith<$Res> {
  factory _$$AddAndRemoveFromCartImplCopyWith(_$AddAndRemoveFromCartImpl value,
          $Res Function(_$AddAndRemoveFromCartImpl) then) =
      __$$AddAndRemoveFromCartImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AddAndRemoveFromCartImplCopyWithImpl<$Res>
    extends _$CartStateCopyWithImpl<$Res, _$AddAndRemoveFromCartImpl>
    implements _$$AddAndRemoveFromCartImplCopyWith<$Res> {
  __$$AddAndRemoveFromCartImplCopyWithImpl(_$AddAndRemoveFromCartImpl _value,
      $Res Function(_$AddAndRemoveFromCartImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$AddAndRemoveFromCartImpl implements _AddAndRemoveFromCart {
  const _$AddAndRemoveFromCartImpl();

  @override
  String toString() {
    return 'CartState.addAndRemoveFromCart()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddAndRemoveFromCartImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() addAndRemoveFromCart,
    required TResult Function(int numberOfItems, double subtotal,
            double deliveryCharges, double total)
        totalsUpdated,
  }) {
    return addAndRemoveFromCart();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? addAndRemoveFromCart,
    TResult? Function(int numberOfItems, double subtotal,
            double deliveryCharges, double total)?
        totalsUpdated,
  }) {
    return addAndRemoveFromCart?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? addAndRemoveFromCart,
    TResult Function(int numberOfItems, double subtotal, double deliveryCharges,
            double total)?
        totalsUpdated,
    required TResult orElse(),
  }) {
    if (addAndRemoveFromCart != null) {
      return addAndRemoveFromCart();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_AddAndRemoveFromCart value) addAndRemoveFromCart,
    required TResult Function(_TotalsUpdated value) totalsUpdated,
  }) {
    return addAndRemoveFromCart(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_AddAndRemoveFromCart value)? addAndRemoveFromCart,
    TResult? Function(_TotalsUpdated value)? totalsUpdated,
  }) {
    return addAndRemoveFromCart?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_AddAndRemoveFromCart value)? addAndRemoveFromCart,
    TResult Function(_TotalsUpdated value)? totalsUpdated,
    required TResult orElse(),
  }) {
    if (addAndRemoveFromCart != null) {
      return addAndRemoveFromCart(this);
    }
    return orElse();
  }
}

abstract class _AddAndRemoveFromCart implements CartState {
  const factory _AddAndRemoveFromCart() = _$AddAndRemoveFromCartImpl;
}

/// @nodoc
abstract class _$$TotalsUpdatedImplCopyWith<$Res> {
  factory _$$TotalsUpdatedImplCopyWith(
          _$TotalsUpdatedImpl value, $Res Function(_$TotalsUpdatedImpl) then) =
      __$$TotalsUpdatedImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {int numberOfItems,
      double subtotal,
      double deliveryCharges,
      double total});
}

/// @nodoc
class __$$TotalsUpdatedImplCopyWithImpl<$Res>
    extends _$CartStateCopyWithImpl<$Res, _$TotalsUpdatedImpl>
    implements _$$TotalsUpdatedImplCopyWith<$Res> {
  __$$TotalsUpdatedImplCopyWithImpl(
      _$TotalsUpdatedImpl _value, $Res Function(_$TotalsUpdatedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? numberOfItems = null,
    Object? subtotal = null,
    Object? deliveryCharges = null,
    Object? total = null,
  }) {
    return _then(_$TotalsUpdatedImpl(
      numberOfItems: null == numberOfItems
          ? _value.numberOfItems
          : numberOfItems // ignore: cast_nullable_to_non_nullable
              as int,
      subtotal: null == subtotal
          ? _value.subtotal
          : subtotal // ignore: cast_nullable_to_non_nullable
              as double,
      deliveryCharges: null == deliveryCharges
          ? _value.deliveryCharges
          : deliveryCharges // ignore: cast_nullable_to_non_nullable
              as double,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$TotalsUpdatedImpl implements _TotalsUpdated {
  const _$TotalsUpdatedImpl(
      {required this.numberOfItems,
      required this.subtotal,
      required this.deliveryCharges,
      required this.total});

  @override
  final int numberOfItems;
  @override
  final double subtotal;
  @override
  final double deliveryCharges;
  @override
  final double total;

  @override
  String toString() {
    return 'CartState.totalsUpdated(numberOfItems: $numberOfItems, subtotal: $subtotal, deliveryCharges: $deliveryCharges, total: $total)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TotalsUpdatedImpl &&
            (identical(other.numberOfItems, numberOfItems) ||
                other.numberOfItems == numberOfItems) &&
            (identical(other.subtotal, subtotal) ||
                other.subtotal == subtotal) &&
            (identical(other.deliveryCharges, deliveryCharges) ||
                other.deliveryCharges == deliveryCharges) &&
            (identical(other.total, total) || other.total == total));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, numberOfItems, subtotal, deliveryCharges, total);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TotalsUpdatedImplCopyWith<_$TotalsUpdatedImpl> get copyWith =>
      __$$TotalsUpdatedImplCopyWithImpl<_$TotalsUpdatedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() addAndRemoveFromCart,
    required TResult Function(int numberOfItems, double subtotal,
            double deliveryCharges, double total)
        totalsUpdated,
  }) {
    return totalsUpdated(numberOfItems, subtotal, deliveryCharges, total);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? addAndRemoveFromCart,
    TResult? Function(int numberOfItems, double subtotal,
            double deliveryCharges, double total)?
        totalsUpdated,
  }) {
    return totalsUpdated?.call(numberOfItems, subtotal, deliveryCharges, total);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? addAndRemoveFromCart,
    TResult Function(int numberOfItems, double subtotal, double deliveryCharges,
            double total)?
        totalsUpdated,
    required TResult orElse(),
  }) {
    if (totalsUpdated != null) {
      return totalsUpdated(numberOfItems, subtotal, deliveryCharges, total);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_AddAndRemoveFromCart value) addAndRemoveFromCart,
    required TResult Function(_TotalsUpdated value) totalsUpdated,
  }) {
    return totalsUpdated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_AddAndRemoveFromCart value)? addAndRemoveFromCart,
    TResult? Function(_TotalsUpdated value)? totalsUpdated,
  }) {
    return totalsUpdated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_AddAndRemoveFromCart value)? addAndRemoveFromCart,
    TResult Function(_TotalsUpdated value)? totalsUpdated,
    required TResult orElse(),
  }) {
    if (totalsUpdated != null) {
      return totalsUpdated(this);
    }
    return orElse();
  }
}

abstract class _TotalsUpdated implements CartState {
  const factory _TotalsUpdated(
      {required final int numberOfItems,
      required final double subtotal,
      required final double deliveryCharges,
      required final double total}) = _$TotalsUpdatedImpl;

  int get numberOfItems;
  double get subtotal;
  double get deliveryCharges;
  double get total;
  @JsonKey(ignore: true)
  _$$TotalsUpdatedImplCopyWith<_$TotalsUpdatedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
