import 'package:bloc/bloc.dart';
import 'package:route_task/presentation/cubit/cart_cubit/cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());

  void increment() {
    if (state is CartLoaded) {
      final currentCount = (state as CartLoaded).count;
      emit(CartLoaded(currentCount + 1));
    } else {
      emit(CartLoaded(1));
    }
  }
}