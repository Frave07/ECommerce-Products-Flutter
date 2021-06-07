part of 'product_bloc.dart';

@immutable
class ProductState {

  final List<ProductCart> products;
  final double total;
  final int amount;
  final double delivery;
  final double insurance;

  ProductState({
    this.products,
    this.total  = 00.0,
    this.amount = 0,
    this.delivery  = 15.0,
    this.insurance = 10.0
  });

  ProductState copyWith({ List<ProductCart> products , double total, int amount, double delivery, double insurance })
    => ProductState(
      products: products ?? this.products,
      total: total ?? this.total,
      amount: amount ?? this.amount,
      delivery: delivery ?? this.delivery,
      insurance: insurance ?? this.insurance
    );

}
