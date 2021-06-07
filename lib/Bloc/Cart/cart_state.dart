part of 'cart_bloc.dart';

@immutable
class CartState {

  final String totalAmount;
  final String currency;
  final bool cardActive;
  final CreditCardFrave creditCardFrave;


  const CartState({
    this.totalAmount = '00.0', 
    this.currency    = 'USD', 
    this.cardActive  = false, 
    this.creditCardFrave 
  });

  // String get amountPayString => '${ ( this.totalAmount * 100 ).floor() }';


  CartState copyWith({String totalAmount, String currency, bool cardActive, CreditCardFrave creditCardFrave })
    => CartState(
      totalAmount : totalAmount ?? this.totalAmount,
      currency : currency ?? this.currency,
      cardActive : cardActive ?? this.cardActive,
      creditCardFrave : creditCardFrave ?? this.creditCardFrave
    );

}


class LoadingPaymentState extends CartState {}

class SuccessPaymentState extends CartState {}

class FailurePaymentState extends CartState {
  final String err;

  FailurePaymentState({this.err});
}
