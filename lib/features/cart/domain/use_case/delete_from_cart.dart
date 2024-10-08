import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/error/failure.dart';
import 'package:ecommerce/features/cart/domain/entities/cart_entities.dart';
import 'package:ecommerce/features/cart/domain/repositories/cart_repositories.dart';
import 'package:injectable/injectable.dart';
@lazySingleton
class DeleteFromCart {
final CartRepositories cartRepositories;
  const DeleteFromCart(this.cartRepositories);
 Future<Either<Failure, Cart>> call(String productId) => cartRepositories.deleteFromCart(productId);
}
