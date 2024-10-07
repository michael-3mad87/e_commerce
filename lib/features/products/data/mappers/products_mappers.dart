import 'package:ecommerce/features/products/data/models/product_%20model.dart';
import 'package:ecommerce/features/products/domain/entities/products_entities.dart';

extension ProductsMappers on ProductModel {
  Product get toEntity => Product(
        sold: sold,
        imagesURLs: imagesURLs,
        ratingsQuantity: ratingsQuantity,
        id: id,
        title: title,
        description: description,
        quantity: quantity,
        price: price,
        imageCoverURL: imageCoverURL,
        ratingsAverage: ratingsAverage,
      );
}
