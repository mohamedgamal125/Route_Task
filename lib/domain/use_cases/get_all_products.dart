

import 'package:route_task/domain/entities/product.dart';
import 'package:route_task/domain/repositories/product_repository.dart';

class GetAllProducts{

  final ProductRepository repo;

  GetAllProducts(this.repo);

  Future<List<Product>> call()async{

    return await repo.getAllProducts();
  }
}