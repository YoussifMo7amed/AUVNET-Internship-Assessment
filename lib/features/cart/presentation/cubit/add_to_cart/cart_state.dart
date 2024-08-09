part of 'cart_cubit.dart';

@freezed
class CartState with _$CartState {
  const factory CartState.initial() = _Initial;
  const factory CartState.addAndRemoveFromCart() = _AddAndRemoveFromCart;
  const factory CartState.totalsUpdated({
    required int numberOfItems,
    required double subtotal,
    required double deliveryCharges,
    required double total,
  }) = _TotalsUpdated;
  const factory CartState.clearCart() = ClearCart;
}
