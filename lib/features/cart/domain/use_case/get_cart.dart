import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/error/failure.dart';
import 'package:ecommerce/features/cart/domain/entities/cart_entities.dart';
import 'package:ecommerce/features/cart/domain/repositories/cart_repositories.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetCart {
 final CartRepositories cartRepositories;
  const GetCart(this.cartRepositories);
 Future<Either<Failure, Cart>> call() => cartRepositories.getCart();
}
