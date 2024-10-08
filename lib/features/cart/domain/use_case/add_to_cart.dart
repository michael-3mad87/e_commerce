import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/error/failure.dart';
import 'package:ecommerce/features/cart/domain/repositories/cart_repositories.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class AddToCart {
  final CartRepositories cartRepositories;
  const AddToCart(this.cartRepositories);
 Future<Either<Failure, void>> call(String productId) => cartRepositories.addToCart(productId);
}
