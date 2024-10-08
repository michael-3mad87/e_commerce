import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/error/exception.dart';
import 'package:ecommerce/core/error/failure.dart';
import 'package:ecommerce/features/products/data/data_sources/remote/products_remote_data_sources.dart';
import 'package:ecommerce/features/products/data/mappers/products_mappers.dart';
import 'package:ecommerce/features/products/domain/entities/products_entities.dart';
import 'package:ecommerce/features/products/domain/repository/products_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: ProductsRepository)
class ProductsRepositoryImpl implements ProductsRepository {
  ProductsRemoteDataSources productsRemoteDataSources;
  ProductsRepositoryImpl(this.productsRemoteDataSources);
  @override
  Future<Either<Failure, List<Product>>> getProducts(String? categoryId) async {
    try {
      final response = await productsRemoteDataSources.getProduct(categoryId);
      return Right(
        response.products
            .map(
              (productModel) => productModel.toEntity,
            )
            .toList(),
      );
    } on RemoteException catch (e) {
      return Left(Failure(e.message));
    }
  }
}
