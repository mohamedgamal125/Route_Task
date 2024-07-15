abstract class CartState {}

class CartInitial extends CartState {}

class CartLoaded extends CartState {
  final int count;

  CartLoaded(this.count);
}