
import 'package:route_task/domain/entities/product.dart';

abstract class ProductRepository {
  Future<List<Product>> getAllProducts();
}