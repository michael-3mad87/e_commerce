part of 'cart_cubit.dart';

@immutable
sealed class CartState {}

final class CartInitial extends CartState {}

final class AddToCartLoading extends CartState {}

final class AddToCartSuccess extends CartState {}

final class AddToCartError extends CartState {
  final String message;
  AddToCartError(this.message);
}

final class GetCartLoading extends CartState {}

final class GetCartSuccess extends CartState {}

final class GetCartError extends CartState {
  final String message;
  GetCartError(this.message);
}

final class UpdateCartLoading extends CartState {}

final class UpdateCartSuccess extends CartState {}

final class UpdateCartError extends CartState {
  final String message;
  UpdateCartError(this.message);
}

final class DeleteFromCartLoading extends CartState {}

final class DeleteFromCartSuccess extends CartState {}

final class DeleteFromCartError extends CartState {
  final String message;
  DeleteFromCartError(this.message);
}
