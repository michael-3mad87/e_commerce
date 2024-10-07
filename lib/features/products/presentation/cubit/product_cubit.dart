import 'package:bloc/bloc.dart';
import 'package:ecommerce/features/products/domain/entities/products_entities.dart';

import 'package:ecommerce/features/products/domain/use_cases/get_products.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'product_state.dart';

@injectable
class ProductCubit extends Cubit<ProductState> {
  final GetProducts _getProducts;
  ProductCubit(this._getProducts) : super(ProductInitial());

  Future<void> getProduct(String categoryId) async {
    emit(ProductLoading());
    final result = await _getProducts(categoryId);
    result.fold(
      (failure) => emit(ProductError(failure.message)),
      (products) => emit(ProductSuccess(products)),
    );
  }
  void onQuantityChanged() => emit(QuantityOnChanged());
}
