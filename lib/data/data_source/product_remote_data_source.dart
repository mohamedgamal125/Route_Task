import 'package:dio/dio.dart';
import 'package:route_task/data/models/product_model.dart';

class ProductRemoteDataSource {
  final Dio dio;

  ProductRemoteDataSource(this.dio);

  Future<List<ProductModel>> getAllProducts() async {
    final response = await dio.get('https://dummyjson.com/products');
    if (response.statusCode == 200) {
      return (response.data['products'] as List)
          .map((json) => ProductModel.fromJson(json))
          .toList();
    } else {
      throw Exception('Failed to load products');
    }
  }
}