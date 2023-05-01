part of 'product_bloc.dart';

@immutable
abstract class ProductEvent {}


class OnAddOrDeleteProductFavoriteEvent extends ProductEvent{
  final String uidProduct;

  OnAddOrDeleteProductFavoriteEvent({required this.uidProduct});
}


class OnAddProductToCartEvent extends ProductEvent {
  final ProductCart product;

  OnAddProductToCartEvent(this.product);
}


class OnDeleteProductToCartEvent extends ProductEvent {
  final int index;

  OnDeleteProductToCartEvent(this.index);

}


class OnPlusQuantityProductEvent extends ProductEvent {
  final int plus;

  OnPlusQuantityProductEvent(this.plus);
}


class OnSubtractQuantityProductEvent extends ProductEvent {
  final int subtract;

  OnSubtractQuantityProductEvent(this.subtract);
}


class OnClearProductsEvent extends ProductEvent {}


class OnSaveProductsBuyToDatabaseEvent extends ProductEvent { 
  final String amount;
  final List<ProductCart> product;

  OnSaveProductsBuyToDatabaseEvent(this.amount, this.product);
}


class OnSelectPathImageProductEvent extends ProductEvent {
  final String image;

  OnSelectPathImageProductEvent(this.image);
}

class OnSaveNewProductEvent extends ProductEvent {
  final String name;
  final String description;
  final String stock;
  final String price;
  final String uidCategory;
  final String image;

  OnSaveNewProductEvent(this.name, this.description, this.stock, this.price, this.uidCategory, this.image);
}


