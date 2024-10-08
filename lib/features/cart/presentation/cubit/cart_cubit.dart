import 'package:bloc/bloc.dart';
import 'package:ecommerce/features/cart/domain/entities/cart_entities.dart';
import 'package:ecommerce/features/cart/domain/use_case/add_to_cart.dart';
import 'package:ecommerce/features/cart/domain/use_case/delete_from_cart.dart';
import 'package:ecommerce/features/cart/domain/use_case/get_cart.dart';
import 'package:ecommerce/features/cart/domain/use_case/update_cart.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'cart_state.dart';

@lazySingleton
class CartCubit extends Cubit<CartState> {
  CartCubit(
    this._addToCart,
    this._getCart,
    this._updateCart,
    this._deleteFromCart,
  ) : super(CartInitial());
  final AddToCart _addToCart;
  final GetCart _getCart;
  final UpdateCart _updateCart;
  final DeleteFromCart _deleteFromCart;
  late Cart cart;

  Future<void> addToCart(String productId) async {
    emit(AddToCartLoading());
    final result = await _addToCart(productId);
    result.fold(
      (failure) => emit(AddToCartError(failure.message)),
      (_) => emit(AddToCartSuccess()),
    );
  }

  Future<void> getCart() async {
    emit(GetCartLoading());
    final result = await _getCart();
    result.fold(
      (failure) => emit(GetCartError(failure.message)),
      (userCart) {
        cart = userCart;
        emit(GetCartSuccess());
      },
    );
  }
   Future<void> updateCart(String productId , int quantity) async {
    emit(UpdateCartLoading());
    final result = await _updateCart(productId, quantity);
    result.fold(
      (failure) => emit(UpdateCartError(failure.message)),
      (userCart) {
        cart = userCart;
        emit(UpdateCartSuccess());
      },
    );
  }
   Future<void> deleteFromCart(String productId) async {
    emit(DeleteFromCartLoading());
    final result = await _deleteFromCart(productId);
    result.fold(
      (failure) => emit(DeleteFromCartError(failure.message)),
      (userCart) {
        cart = userCart;
        emit(DeleteFromCartSuccess());
      },
    );
  }
}
