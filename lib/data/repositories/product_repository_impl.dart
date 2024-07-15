import 'package:route_task/data/data_source/product_remote_data_source.dart';
import 'package:route_task/domain/entities/product.dart';
import 'package:route_task/domain/repositories/product_repository.dart';

class ProductRepositoryImpl implements ProductRepository {

    final ProductRemoteDataSource remoteDataSource;

    ProductRepositoryImpl(this.remoteDataSource);

  @override
  Future<List<Product>> getAllProducts()async {

    final products= await remoteDataSource.getAllProducts();
    return products.map((elm) =>Product(
        id: elm.id,
        title: elm.title,
        description: elm.description,
        price: elm.price,
        discountPercentage: elm.discountPercentage,
        rating:  elm.rating,
        images: elm.images
    )
    ).toList();

  }


}