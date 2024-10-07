import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/error/failure.dart';
import 'package:ecommerce/features/home/domain/entities/category.dart';
import 'package:ecommerce/features/home/domain/repository/home_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetCategories {
  final HomeRepository homeRepository;
  GetCategories(this.homeRepository);
  Future<Either<Failure, List<Category>>> call() =>
      homeRepository.getCategory();
}
