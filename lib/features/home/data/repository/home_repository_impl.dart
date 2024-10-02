import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/error/exception.dart';
import 'package:ecommerce/core/error/failure.dart';
import 'package:ecommerce/features/home/data/data_source/remote/home_remote_data_source.dart';
import 'package:ecommerce/features/home/data/mappers/home_mapper.dart';
import 'package:ecommerce/features/home/domain/entities/category.dart';
import 'package:ecommerce/features/home/domain/repository/home_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: HomeRepository)
class HomeRepositoryImpl implements HomeRepository {
  HomeRemoteDataSource homeRemoteDataSource;
  HomeRepositoryImpl(this.homeRemoteDataSource);

  @override
  Future<Either<Failure, List<Category>>> getCategory() async {
    try {
      final response = await homeRemoteDataSource.getCategory();
      return Right(
        response.categories
            .map((categoryModel) => categoryModel.toEntity)
            .toList(),
      );
    } on AppException catch (e) {
      return Left(Failure(e.message));
    }
  }
}
