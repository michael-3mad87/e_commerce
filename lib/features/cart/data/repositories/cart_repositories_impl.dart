import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/error/exception.dart';
import 'package:ecommerce/core/error/failure.dart';
import 'package:ecommerce/features/cart/data/data_source/remote/cart_remote_data_source.dart';
import 'package:ecommerce/features/cart/data/mappers/cart_mapper.dart';
import 'package:ecommerce/features/cart/domain/entities/cart_entities.dart';

import 'package:ecommerce/features/cart/domain/repositories/cart_repositories.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: CartRepositories)
class CartRepositoriesImpl implements CartRepositories {
  final CartRemoteDataSource cartRemoteDataSource;
  const CartRepositoriesImpl(this.cartRemoteDataSource);
  @override
  Future<Either<Failure, void>> addToCart(productId) async {
    try {
      await cartRemoteDataSource.addToCart(productId);
      return const Right(null);
    } on RemoteException catch (e) {
      return Left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, Cart>> getCart() async {
    try {
      final response = await cartRemoteDataSource.getCart();
      return Right(response.cart.toEntity);
    } on RemoteException catch (e) {
      return Left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, Cart>> updateCart(
    productId,
    quantity,
  ) async {
    try {
      final response =
          await cartRemoteDataSource.updateCart(productId, quantity);
      return Right(response.cart.toEntity);
    } on RemoteException catch (e) {
      return Left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, Cart>> deleteFromCart(productId) async {
    try {
      final response = await cartRemoteDataSource.deleteFromCart(productId);
      return Right(response.cart.toEntity);
    } on RemoteException catch (e) {
      return Left(Failure(e.message));
    }
  }
}
