import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/error/failure.dart';
import 'package:ecommerce/features/products/domain/entities/products_entities.dart';
import 'package:ecommerce/features/products/domain/repository/products_repository.dart';
import 'package:injectable/injectable.dart';
@lazySingleton
class GetProducts {
  ProductsRepository repository;
  GetProducts(this.repository);
 Future<Either<Failure, List<Product>>> call(String?categoryId) => repository.getProducts(categoryId);
}
