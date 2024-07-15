import 'package:bloc/bloc.dart';
import 'package:route_task/domain/use_cases/get_all_products.dart';
import 'package:route_task/presentation/cubit/product_cubit/product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  final GetAllProducts getAllProducts;

  ProductCubit(this.getAllProducts) : super(ProductInitial());

  Future<void> fetchAllProducts() async {
    try {
      emit(ProductLoading());
      final products = await getAllProducts();
      emit(ProductLoaded(products));
    } catch (e) {
      emit(ProductError(e.toString()));
    }
  }
}